import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:dtc6464/core/services/network_caller.dart';
import 'package:dtc6464/core/services/storage_service.dart';
import 'package:dtc6464/core/utils/constants/api_constants.dart';
import 'package:dtc6464/core/utils/logging/logger.dart';
import 'package:dtc6464/features/practice/model/question_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../core/utils/constants/snackbar_constant.dart';
import '../../../core/utils/helpers/app_helper.dart';
import '../views/screens/ai_coach_mode.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PracticeController extends GetxController {
  final NetworkCaller _networkCaller = Get.find<NetworkCaller>();
  late AudioRecorder audioRecorder;
  late AudioPlayer audioPlayer;

  // Observables
  var selectedIndex = 0.obs;
  var selectedTopic = "".obs;
  var isRecording = false.obs;
  var recordedPath = "".obs;
  var amplitude = 0.0.obs;
  var isPlaying = false.obs;
  var position = Duration.zero.obs;
  var duration = Duration.zero.obs;
  RxString inputType = 'voice'.obs;
  RxBool isStartPracticeLoading = false.obs;
  Rx<QuestionsModel?> questions = Rx<QuestionsModel?>(null);
  final FlutterTts flutterTts = FlutterTts();
  RxBool isTtsLoading = false.obs;

  final SpeechToText _speechToText = SpeechToText();
  RxBool isListening = false.obs;
  RxString recognizedText = "".obs;

  StreamSubscription<Amplitude>? _amplitudeSubscription;
  StreamSubscription<Duration>? _posSub;
  StreamSubscription<Duration>? _durSub;
  StreamSubscription<PlayerState>? _stateSub;

  List<String> interviewType = ["Technical", "Non-Technical"];

  @override
  void onInit() {
    super.onInit();
    _initAudioSystems();
    _initTts();
  }

  // স্পিচ সার্ভিস ইনিশিয়ালাইজ করা
  void initSpeech() async {
    bool available = await _speechToText.initialize();
    if (available) {
      print("Speech recognition available");
    }
  }

  // লিসেনিং শুরু করা
  void startListening() async {
    await _speechToText.listen(
      onResult: (result) {
        recognizedText.value = result.recognizedWords;
      },
    );
    isListening.value = true;
  }

  // লিসেনিং থামানো
  void stopListening() async {
    await _speechToText.stop();
    isListening.value = false;
  }


  void _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(2.0);
    await flutterTts.setSpeechRate(0.5);
  }

  Future<void> speak(String text) async {
    if (text.isNotEmpty) {
      await flutterTts.speak(text);
    }
  }

  Future<void> stopTts() async {
    await flutterTts.stop();
  }

  void _initAudioSystems() {
    audioRecorder = AudioRecorder();
    audioPlayer = AudioPlayer();

    _durSub = audioPlayer.onDurationChanged.listen((d) => duration.value = d);
    _posSub = audioPlayer.onPositionChanged.listen((p) => position.value = p);
    _stateSub = audioPlayer.onPlayerStateChanged.listen(
      (s) => isPlaying.value = s == PlayerState.playing,
    );

    audioPlayer.onPlayerComplete.listen((_) {
      isPlaying.value = false;
      position.value = Duration.zero;
    });
  }

  void selectType(int index) => selectedIndex.value = index;

  Future<void> startRecording() async {
    await HapticFeedback.mediumImpact();
    try {
      if (!await audioRecorder.hasPermission()) return;

      final dir = await getApplicationDocumentsDirectory();
      final path =
          '${dir.path}/rec_${DateTime.now().millisecondsSinceEpoch}.m4a';

      await audioRecorder.start(
        const RecordConfig(encoder: AudioEncoder.aacLc),
        path: path,
      );
      isRecording.value = true;
      recordedPath.value = "";

      _amplitudeSubscription = audioRecorder
          .onAmplitudeChanged(const Duration(milliseconds: 100))
          .listen((amp) {
            double currentAmp = amp.current.clamp(-50.0, 0.0);
            amplitude.value = (currentAmp + 50.0) / 50.0;
          });
    } catch (_) {}
  }

  Future<void> stopRecording() async {
    try {
      _amplitudeSubscription?.cancel();
      final path = await audioRecorder.stop();
      isRecording.value = false;
      amplitude.value = 0.0;
      if (path != null) recordedPath.value = path;
    } catch (_) {}
  }

  Future<void> playRecording() async {
    if (recordedPath.isEmpty) return;
    try {
      if (isPlaying.value) {
        await audioPlayer.pause();
      } else {
        await audioPlayer.play(DeviceFileSource(recordedPath.value));
      }
    } catch (_) {}
  }

  Future<void> seek(double ms) async {
    await audioPlayer.seek(Duration(milliseconds: ms.toInt()));
  }

  Future<void> startInterview(BuildContext context) async {
    try {
      isStartPracticeLoading.value = true;
      final token = StorageService.accessToken;
      final response = await _networkCaller.postRequest(
        ApiConstant.baseUrl + ApiConstant.startInterview,
        body: {
          "type": selectedIndex.value == 1 ? "behavioral" : "technical",
          "category": selectedTopic.value,
        },
        token: token,
      );

      if (!response.isSuccess) {
        isStartPracticeLoading.value = false;
        SnackBarConstant.error(title: 'Failed', message: response.errorMessage);
        Navigator.pop(context);
        return;
      }

      questions.value = QuestionsModel.fromJson(response.responseData);
      isStartPracticeLoading.value = false;
    } catch (e) {
      isStartPracticeLoading.value = false;
      Navigator.pop(context);
      SnackBarConstant.error(title: 'Failed', message: e.toString());
    } finally {
      isStartPracticeLoading.value = false;
    }
  }

  // শুধুমাত্র স্পিচ-টু-টেক্সট করার জন্য নতুন ফাংশন
  Future<void> toggleSpeechToText() async {
    if (_speechToText.isListening) {
      // যদি অলরেডি শুনছে, তবে থামিয়ে দিন
      await _speechToText.stop();
      isListening.value = false;
    } else {
      // লিসেনিং শুরু করুন
      bool available = await _speechToText.initialize(
        onError: (error) => AppLoggerHelper.debug("STT Error: $error"),
        onStatus: (status) {
          AppLoggerHelper.debug("STT Status: $status");
          if (status == 'notListening' || status == 'done') {
            isListening.value = false;
          }
        },
      );

      if (available) {
        isListening.value = true;
        recognizedText.value = ""; // আগের টেক্সট ক্লিয়ার করুন

        await _speechToText.listen(
          onResult: (result) {
            recognizedText.value = result.recognizedWords;
            // রিয়েল টাইমে ডাটা আপডেট করার জন্য
            AppLoggerHelper.debug("Recognized: ${result.recognizedWords}");
          },
          listenMode: ListenMode.dictation, // বড় বাক্যের জন্য এটি ভালো
          partialResults: true, // কথা বলার সময় লাইভ টেক্সট দেখাবে
        );
      } else {
        SnackBarConstant.error(title: "Error", message: "Speech recognition not available on this device.");
      }
    }
  }

  PersonalizedQuestion getPlaceholderQuestion() {
    return PersonalizedQuestion(
      question:
          "This is a dummy question to show the shimmer effect while loading data.",
      hints: ["Hint 1", "Hint 2", "Hint 3"],
    );
  }

  @override
  void onClose() {
    _amplitudeSubscription?.cancel();
    _posSub?.cancel();
    _durSub?.cancel();
    _stateSub?.cancel();
    audioRecorder.dispose();
    audioPlayer.dispose();
    flutterTts.stop();
    super.onClose();
  }
}

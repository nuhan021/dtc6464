import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:dtc6464/core/services/network_caller.dart';
import 'package:dtc6464/core/services/storage_service.dart';
import 'package:dtc6464/core/utils/constants/api_constants.dart';
import 'package:dtc6464/core/utils/logging/logger.dart';
import 'package:dtc6464/features/practice/model/analize_model.dart';
import 'package:dtc6464/features/practice/model/question_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../../core/utils/constants/snackbar_constant.dart';
import 'package:flutter_tts/flutter_tts.dart';

/// [PracticeController] manages the interview practice logic including
/// Speech-to-Text (STT), Text-to-Speech (TTS), Audio Recording, and API interactions.
class PracticeController extends GetxController {
  final NetworkCaller _networkCaller = Get.find<NetworkCaller>();

  // ==========================================
  // SERVICES & ENGINES
  // ==========================================
  late AudioRecorder audioRecorder;
  late AudioPlayer audioPlayer;
  final SpeechToText _speechToText = SpeechToText();
  final FlutterTts flutterTts = FlutterTts();

  // ==========================================
  // INTERVIEW CONFIGURATION & STATE
  // ==========================================
  var selectedIndex = 0.obs;
  var selectedTopic = "".obs;
  List<String> interviewType = ["Technical", "Non-Technical"];
  RxInt selectedQuestion = 0.obs;
  RxString inputType = 'voice'.obs; // 'voice' or 'type'

  // ==========================================
  // SPEECH TO TEXT (STT) STATES
  // ==========================================
  var isRecording = false.obs;
  var isListening = false.obs;
  RxString recognizedText = "".obs;
  String _completeSentence = ""; // Internal buffer to prevent text duplication
  final TextEditingController answerController = TextEditingController();

  // ==========================================
  // AUDIO PLAYER & RECORDING STATES
  // ==========================================
  var recordedPath = "".obs;
  var amplitude = 0.0.obs;
  var isPlaying = false.obs;
  var position = Duration.zero.obs;
  var duration = Duration.zero.obs;

  // ==========================================
  // API & LOADING STATES
  // ==========================================
  RxBool isStartPracticeLoading = false.obs;
  RxBool isSubmitAnswerLoading = false.obs;
  Rx<QuestionsModel?> questions = Rx<QuestionsModel?>(null);
  Rx<AnalizeModel?> analizeData = Rx<AnalizeModel?>(null);

  // ==========================================
  // SUBSCRIPTIONS
  // ==========================================
  StreamSubscription<Amplitude>? _amplitudeSubscription;
  StreamSubscription<Duration>? _posSub;
  StreamSubscription<Duration>? _durSub;
  StreamSubscription<PlayerState>? _stateSub;

  @override
  void onInit() {
    super.onInit();
    _initAudioSystems();
    _initTts();
  }

  // ---------------------------------------------------------------------------
  // INITIALIZATION METHODS
  // ---------------------------------------------------------------------------

  /// Initializes the audio player listeners for progress and state tracking.
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

  /// Configures Flutter Text-to-Speech settings.
  void _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
  }

  // ---------------------------------------------------------------------------
  // SPEECH TO TEXT (STT) LOGIC
  // ---------------------------------------------------------------------------

  /// Core logic for handling live speech recognition results.
  /// Combines new words with [_completeSentence] to manage the text area.
  void _startSpeechEngine() {
    _speechToText.listen(
      onResult: (result) {
        if (!isRecording.value) return;

        String currentWords = result.recognizedWords.trim();

        String finalCalculatedText = _completeSentence.isEmpty
            ? currentWords
            : "$_completeSentence $currentWords".trim();

        recognizedText.value = finalCalculatedText;
        answerController.text = finalCalculatedText;

        // Keep cursor at the end for seamless user experience
        answerController.selection = TextSelection.fromPosition(
          TextPosition(offset: answerController.text.length),
        );

        if (result.finalResult) {
          _completeSentence = finalCalculatedText;
        }
      },
      listenMode: ListenMode.dictation,
      partialResults: true,
    );
  }

  /// Initializes listening. Auto-restarts if engine stops while button is held.
  Future<void> startListening() async {
    await HapticFeedback.mediumImpact();
    _completeSentence = answerController.text.trim();

    bool available = await _speechToText.initialize(
      onStatus: (status) {
        if (status == 'notListening' && isRecording.value) {
          _startSpeechEngine();
        }
      },
    );

    if (available) {
      isRecording.value = true;
      _startSpeechEngine();
    }
  }

  /// Stops the STT engine and locks the final text.
  Future<void> stopListening() async {
    isRecording.value = false;
    await _speechToText.stop();

    _completeSentence = answerController.text.trim();
    recognizedText.value = _completeSentence;
  }

  // ---------------------------------------------------------------------------
  // INTERVIEW & API LOGIC
  // ---------------------------------------------------------------------------

  /// Fetches a new interview session from the backend.
  Future<void> startInterview(BuildContext context) async {
    try {
      resetData();
      isStartPracticeLoading.value = true;

      final response = await _networkCaller.postRequest(
        ApiConstant.baseUrl + ApiConstant.startInterview,
        body: {
          "type": selectedIndex.value == 1 ? "behavioral" : "technical",
          "category": selectedTopic.value,
        },
        token: StorageService.accessToken,
      );

      if (response.isSuccess) {
        questions.value = QuestionsModel.fromJson(response.responseData);
      } else {
        SnackBarConstant.error(title: 'Failed', message: response.errorMessage);
        Navigator.pop(context);
      }
    } catch (e) {
      SnackBarConstant.error(title: 'Error', message: e.toString());
      Navigator.pop(context);
    } finally {
      isStartPracticeLoading.value = false;
    }
  }

  /// Submits the user's answer for evaluation.
  Future<void> submitInterview(BuildContext context) async {
    try {
      isSubmitAnswerLoading.value = true;
      final token = StorageService.accessToken;
      final response = await _networkCaller.postRequest(
          ApiConstant.baseUrl + ApiConstant.submitInterview + questions.value!.data.sessionId,
          body: {
            "question": questions.value!.data.aiData.personalizedQuestions[selectedQuestion.value].question,
            "answer": recognizedText.value.trim(),
          },
          token: token
      );

      if(!response.isSuccess) {
        isSubmitAnswerLoading.value = false;
        SnackBarConstant.error(title: 'Failed', message: response.errorMessage);
        Navigator.pop(context);
        return;
      }

      analizeData.value = AnalizeModel.fromJson(response.responseData);
      isSubmitAnswerLoading.value = false;
    } catch (e) {
      isSubmitAnswerLoading.value = false;
      Navigator.pop(context);
      SnackBarConstant.error(title: 'Error', message: e.toString());
    } finally {
      isSubmitAnswerLoading.value = false;
    }
  }

  /// Increments question index and resets specific question-based data.
  void nextQuestion() {
    if (questions.value != null &&
        selectedQuestion.value < questions.value!.data.aiData.personalizedQuestions.length - 1) {
      selectedQuestion.value++;

      recognizedText.value = "";
      _completeSentence = "";
      recordedPath.value = "";
      answerController.clear();
    } else {
      SnackBarConstant.success(title: 'Finished', message: 'You have completed all questions!');
    }
  }

  /// Updates internal sentence buffer when manual edits occur.
  void updateCompleteSentence(String value) {
    _completeSentence = value.trim();
    recognizedText.value = value.trim();
  }

  // ---------------------------------------------------------------------------
  // AUDIO RECORDING LOGIC
  // ---------------------------------------------------------------------------

  /// Starts raw audio recording to local storage.
  Future<void> startRecording() async {
    await HapticFeedback.mediumImpact();
    try {
      if (!await audioRecorder.hasPermission()) return;
      final dir = await getApplicationDocumentsDirectory();
      final path = '${dir.path}/rec_${DateTime.now().millisecondsSinceEpoch}.m4a';

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

  /// Stops audio recording and saves file path.
  Future<void> stopRecording() async {
    try {
      _amplitudeSubscription?.cancel();
      final path = await audioRecorder.stop();
      isRecording.value = false;
      amplitude.value = 0.0;
      if (path != null) recordedPath.value = path;
      AppLoggerHelper.debug(answerController.text);
    } catch (_) {}
  }

  // ---------------------------------------------------------------------------
  // HELPERS & CLEANUP
  // ---------------------------------------------------------------------------

  /// Completely resets the controller state for a fresh start.
  void resetData() {
    selectedQuestion.value = 0;
    recognizedText.value = "";
    _completeSentence = "";
    recordedPath.value = "";
    answerController.clear();
    isRecording.value = false;
    isListening.value = false;
    amplitude.value = 0.0;
    position.value = Duration.zero;
    duration.value = Duration.zero;
    questions.value = null;
  }

  void selectType(int index) => selectedIndex.value = index;

  /// Plays question text using TTS engine.
  Future<void> speak(String text) async {
    if (text.isNotEmpty) await flutterTts.speak(text);
  }

  /// Default data for skeleton loading or error states.
  PersonalizedQuestion getPlaceholderQuestion() {
    return PersonalizedQuestion(
      question: "Loading question...",
      hints: ["Hint 1", "Hint 2"],
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
    _speechToText.stop();
    super.onClose();
  }
}
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:flutter/services.dart';

class PracticeController extends GetxController {
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

  StreamSubscription<Amplitude>? _amplitudeSubscription;
  StreamSubscription<Duration>? _posSub;
  StreamSubscription<Duration>? _durSub;
  StreamSubscription<PlayerState>? _stateSub;

  @override
  void onInit() {
    super.onInit();
    _initAudioSystems();
  }

  void _initAudioSystems() {
    audioRecorder = AudioRecorder();
    audioPlayer = AudioPlayer();

    _durSub = audioPlayer.onDurationChanged.listen((d) => duration.value = d);
    _posSub = audioPlayer.onPositionChanged.listen((p) => position.value = p);
    _stateSub = audioPlayer.onPlayerStateChanged.listen((s) => isPlaying.value = s == PlayerState.playing);

    audioPlayer.onPlayerComplete.listen((_) {
      isPlaying.value = false;
      position.value = Duration.zero;
    });
  }

  void selectType(int index) => selectedIndex.value = index;
  void selectTopic(String topic) => selectedTopic.value = topic;

  Future<void> startRecording() async {
    await HapticFeedback.mediumImpact();
    try {
      if (!await audioRecorder.hasPermission()) return;

      final dir = await getApplicationDocumentsDirectory();
      final path = '${dir.path}/rec_${DateTime.now().millisecondsSinceEpoch}.m4a';

      await audioRecorder.start(const RecordConfig(encoder: AudioEncoder.aacLc), path: path);
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

  @override
  void onClose() {
    _amplitudeSubscription?.cancel();
    _posSub?.cancel();
    _durSub?.cancel();
    _stateSub?.cancel();
    audioRecorder.dispose();
    audioPlayer.dispose();
    super.onClose();
  }
}
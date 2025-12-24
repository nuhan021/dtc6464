import 'package:get/get.dart';

class PracticeSession {
  final String title;
  final String dateTime;
  final String scoreOrStatus; // "Score: 85%" or "Completed"
  final bool
  isScore; // true if scoreOrStatus is a percentage, false if "Completed"

  PracticeSession({
    required this.title,
    required this.dateTime,
    required this.scoreOrStatus,
    required this.isScore,
  });
}

class PlannerItem {
  final String title;
  final String dateAndRound;
  final String status; // "Scheduled" or "Completed"

  PlannerItem({
    required this.title,
    required this.dateAndRound,
    required this.status,
  });
}

class HistoryController extends GetxController {
  final activeTab = 0.obs; // 0 = Practice Sessions, 1 = Planner

  final practiceSessionList = <PracticeSession>[
    PracticeSession(
      title: 'Behavioral Interview',
      dateTime: 'Dec 10, 2024 · 15 min',
      scoreOrStatus: 'Score: 85%',
      isScore: true,
    ),
    PracticeSession(
      title: 'Technical Interview',
      dateTime: 'Dec 8, 2024 · 22 min',
      scoreOrStatus: 'Score: 78%',
      isScore: true,
    ),
    PracticeSession(
      title: 'Situational Interview',
      dateTime: 'Dec 5, 2024 · 18 min',
      scoreOrStatus: 'Score: 92%',
      isScore: true,
    ),
    PracticeSession(
      title: 'Leadership Interview',
      dateTime: 'Dec 3, 2024 · 20 min',
      scoreOrStatus: 'Completed',
      isScore: false,
    ),
  ].obs;

  final plannerList = <PlannerItem>[
    PlannerItem(
      title: 'Google',
      dateAndRound: 'Dec 17, 2024 · 1st Round',
      status: 'Scheduled',
    ),
    PlannerItem(
      title: 'Meta',
      dateAndRound: 'Dec 12, 2024 · 2nd Round',
      status: 'Completed',
    ),
    PlannerItem(
      title: 'Amazon',
      dateAndRound: 'Dec 20, 2024 · Final Round',
      status: 'Scheduled',
    ),
    PlannerItem(
      title: 'Apple',
      dateAndRound: 'Dec 6, 2024 · 1st Round',
      status: 'Completed',
    ),
  ].obs;

  void switchTab(int index) {
    activeTab.value = index;
  }

  void navigateBack() {
    Get.back();
  }

  void viewFeedback(String sessionTitle) {
    Get.snackbar('Feedback', 'Viewing feedback for $sessionTitle');
  }
}

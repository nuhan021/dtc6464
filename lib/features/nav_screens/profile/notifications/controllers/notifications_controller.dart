import 'package:get/get.dart';

class NotificationsController extends GetxController {
  final practiceReminders = true.obs;
  final interviewReminders = true.obs;
  final weeklyProgressSummary = true.obs;
  final tipsRecommendations = true.obs;

  void togglePracticeReminders() {
    practiceReminders.value = !practiceReminders.value;
  }

  void toggleInterviewReminders() {
    interviewReminders.value = !interviewReminders.value;
  }

  void toggleWeeklyProgressSummary() {
    weeklyProgressSummary.value = !weeklyProgressSummary.value;
  }

  void toggleTipsRecommendations() {
    tipsRecommendations.value = !tipsRecommendations.value;
  }

  void navigateBack() {
    Get.back();
  }
}

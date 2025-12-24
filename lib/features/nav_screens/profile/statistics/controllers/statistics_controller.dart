import 'package:get/get.dart';

class StatisticsController extends GetxController {
  final overallProgress = 0.0.obs;
  final practiceSessionsCompleted = 28.obs;
  final averageScore = 85.obs;

  void navigateBack() {
    Get.back();
  }
}

import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<String> userName = 'Adam Smith'.obs;
  Rx<String> userAvatar = 'https://placehold.co/61x61'.obs;

  void logout() {
    // TODO: Implement actual logout logic
    Get.snackbar('Logout', 'Logging out...');
  }

  void navigateToStatistics() {
    Get.snackbar('Statistics', 'Navigating to statistics...');
  }

  void navigateToNotifications() {
    Get.snackbar('Notifications', 'Navigating to notifications...');
  }

  void navigateToHistory() {
    Get.snackbar('History', 'Navigating to history...');
  }

  void navigateToEditProfile() {
    Get.snackbar('Edit Profile', 'Navigating to edit profile...');
  }
}

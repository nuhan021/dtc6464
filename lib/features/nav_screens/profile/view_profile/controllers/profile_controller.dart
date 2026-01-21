import 'package:dtc6464/core/services/storage_service.dart';
import 'package:dtc6464/routes/app_routes.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<String> userName = 'Adam Smith'.obs;
  Rx<String> userAvatar = 'https://placehold.co/61x61'.obs;

  Future<void> logout() async {
    await StorageService.logoutUser();
    Get.offAllNamed(AppRoute.getSignInScreen());
    Get.snackbar('Logout', 'Logging out...');
  }

  void navigateToStatistics() {
    Get.toNamed(AppRoute.statisticsScreen);
  }

  void navigateToNotifications() {
    Get.toNamed(AppRoute.notificationsScreen);
  }

  void navigateToHistory() {
    Get.toNamed(AppRoute.historyScreen);
  }

  void navigateToEditProfile() {
    Get.snackbar('Edit Profile', 'Navigating to edit profile...');
  }
}

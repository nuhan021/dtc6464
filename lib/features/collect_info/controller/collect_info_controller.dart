import 'package:dtc6464/core/utils/constants/colors.dart';
import 'package:dtc6464/core/utils/constants/icon_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CollectInfoController extends GetxController {
  // text controllers
  final TextEditingController roleController = TextEditingController();
  final TextEditingController rolePreparingController = TextEditingController();
  final TextEditingController interviewingCompanyController =
      TextEditingController();

  // The list of companies
  final List<String> companies = [
    'Google',
    'Facebook',
    'Amazon',
    'Netflix',
    'Apple',
    'Microsoft',
    'Shopify',
    'Spotify',
    'Startup',
  ];

  // Reactive list to store selected items
  var selectedCompanies = <String>[].obs;

  void toggleSelection(String name) {
    if (selectedCompanies.contains(name)) {
      selectedCompanies.remove(name);
    } else {
      selectedCompanies.add(name);
    }
  }

  // List of levels
  final List<String> levels = ['Beginner', 'Intermediate', 'Advanced'];

  // Reactive variable for the selected level (initially Beginner)
  RxString selectedLevel = 'Beginner'.obs;

  void selectLevel(String level) {
    selectedLevel.value = level;
  }

  final List<String> goals = [
    'Improve behavioral answers',
    'Boost interview confidence',
    'Strengthen technical skills',
    'Track my progress',
    'Master STAR method',
    'Prepare for promotion',
    'Improve system design',
    'Prepare for upcoming interview',
  ].obs;

  final List<String> goalsIcon = [
    IconPath.star,
    IconPath.mic,
    IconPath.brain,
    IconPath.grow,
    IconPath.puzzle,
    IconPath.rocket,
    IconPath.gear,
    IconPath.bag,
  ];

  // Using a set or list to allow multiple selection
  var selectedGoals = <String>[].obs;

  void toggleGoal(String goal) {
    if (selectedGoals.contains(goal)) {
      // If it's already selected, always allow removing it
      selectedGoals.remove(goal);
    } else {
      // Only add if the current count is less than 3
      if (selectedGoals.length < 3) {
        selectedGoals.add(goal);
      } else {
        // Optional: Show a message to the user
        Get.snackbar(
          "Limit Reached",
          "You can only select up to 3 goals",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.softPurpleNormal,
          colorText: AppColors.whiteLight,
          margin: const EdgeInsets.all(15),
          duration: const Duration(seconds: 2),
        );
      }
    }
  }




// weak areas
  final List<String> areas = [
    'Interview anxiety',
    'STAR structure',
    'Long answers',
    'Lack metrics',
    'System design',
    'Technical depth',
    'Thinking Of examples',
    'Filler words',
  ].obs;

  final List<String> areasIcon = [
    IconPath.anxiety,
    IconPath.crown,
    IconPath.noteBook,
    IconPath.human,
    IconPath.monitor,
    IconPath.monitorSetting,
    IconPath.pencil,
    IconPath.speaker,
  ].obs;

  // Using a set or list to allow multiple selection
  var selectedAreas = <String>[].obs;

  void toggleArea(String area) {
    if (selectedAreas.contains(area)) {
      selectedAreas.remove(area);
    } else {
      selectedAreas.add(area);
    }
  }
}

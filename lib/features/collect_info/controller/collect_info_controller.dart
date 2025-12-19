import 'package:dtc6464/core/utils/constants/colors.dart';
import 'package:dtc6464/core/utils/constants/icon_path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class CollectInfoController extends GetxController {
  RxInt currentPageIndex = 0.obs;
  // text controllers
  final TextEditingController roleController = TextEditingController();
  final TextEditingController rolePreparingController = TextEditingController();
  final TextEditingController interviewingCompanyController =
      TextEditingController();
  final TextEditingController jobDescriptionController =
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
          backgroundColor: AppColors.softPurpleDarker,
          colorText: AppColors.whiteLight,
          margin: EdgeInsets.all(15.w),
          icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
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

  var resumes = <int, ResumeModel?>{1: null, 2: null, 3: null}.obs;

  // Logic to check if at least one resume exists
  bool get hasAtLeastOneResume => resumes.values.any((file) => file != null);

  Future<void> pickResume(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      // Conversion logic as before...
      resumes[index] = ResumeModel(
        name: file.name,
        size: "${(file.size / 1024 / 1024).toStringAsFixed(1)} MB",
        path: file.path ?? '',
      );
    }
  }

  void validateAndNext(PageController pageController) {
    String errorMessage = "";

    // Check which page the user is currently on
    switch (currentPageIndex.value) {
      case 0:
        if (roleController.text.trim().isEmpty) {
          errorMessage = "Please enter your current role";
        }
      case 1: // Roles & Company TextFields
        if (rolePreparingController.text.trim().isEmpty)
          errorMessage = "Please enter the role you are preparing for";
        break;

      case 2: // Company Selection (Chips)
        if (selectedCompanies.isEmpty)
          errorMessage = "Please select at least one company";
        break;

      case 3: // Experience Level (Always has Beginner selected, but safe to check)
        if (selectedLevel.value.isEmpty)
          errorMessage = "Please select your experience level";
        break;

      case 4: // Career Goals (Must be exactly 3)
        if (selectedGoals.length < 3)
          errorMessage = "Please select 3 career goals to continue";
        break;

      case 5: // Weak Areas
        if (selectedAreas.isEmpty)
          errorMessage = "Please select at least one area to improve";
        break;

      case 6:
        if (jobDescriptionController.text.trim().isEmpty)
          errorMessage = "Please write job description";
        break;
      case 7: // Resume Upload
        if (!hasAtLeastOneResume)
          errorMessage = "Please upload at least one resume";
        break;
    }

    // If there is an error message, show the snackbar and STOP
    if (errorMessage.isNotEmpty) {
      Get.snackbar(
        "Required Information",
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.softPurpleDarker,
        colorText: AppColors.whiteLight,
        margin: EdgeInsets.all(15.w),
        icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
      );
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }


  void profileAnalize() {
    Get.offNamed(AppRoute.getProfileAnalyzingScreen());
  }
}

class ResumeModel {
  final String name;
  final String size;
  final String path;

  ResumeModel({required this.name, required this.size, required this.path});
}

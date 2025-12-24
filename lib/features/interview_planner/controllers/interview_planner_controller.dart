import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Interview {
  final String id;
  final String companyName;
  final String role;
  final String status; // SCHEDULED, COMPLETED, CANCELLED
  final DateTime interviewDate;
  final String round;
  final String reminder;
  final double preparationProgress;

  Interview({
    required this.id,
    required this.companyName,
    required this.role,
    required this.status,
    required this.interviewDate,
    required this.round,
    required this.reminder,
    required this.preparationProgress,
  });
}

class InterviewPlannerController extends GetxController {
  final interviews = <Interview>[
    Interview(
      id: '1',
      companyName: 'Google',
      role: 'Software Engineer',
      status: 'SCHEDULED',
      interviewDate: DateTime(2025, 12, 13, 12, 25),
      round: '1st Round',
      reminder: '1 day before',
      preparationProgress: 0.2,
    ),
  ].obs;

  final companyNameController = TextEditingController();
  final roleController = TextEditingController();
  final jobDescriptionController = TextEditingController();
  final noteController = TextEditingController();

  final selectedDate = Rx<DateTime?>(null);
  final selectedTime = Rx<TimeOfDay?>(null);
  final selectedPhase = Rx<String?>('1st Round');

  final oneDayReminderEnabled = true.obs;
  final oneHourReminderEnabled = false.obs;

  final interviewPhases = [
    '1st Round',
    '2nd Round',
    '3rd Round',
    'Technical Interview',
    'Behavioral Interview',
    'Final Round',
  ];

  void addInterview(Interview interview) {
    interviews.add(interview);
  }

  void clearForm() {
    companyNameController.clear();
    roleController.clear();
    jobDescriptionController.clear();
    noteController.clear();
    selectedDate.value = null;
    selectedTime.value = null;
    selectedPhase.value = '1st Round';
    oneDayReminderEnabled.value = true;
    oneHourReminderEnabled.value = false;
  }

  String getAvatarInitials(String name) {
    return name.isNotEmpty ? name[0].toUpperCase() : '';
  }

  String getStatusColor(String status) {
    switch (status) {
      case 'SCHEDULED':
        return '0xFFE1F5FE';
      case 'COMPLETED':
        return '0xFFE8F5E9';
      case 'CANCELLED':
        return '0xFFFFEBEE';
      default:
        return '0xFFE1F5FE';
    }
  }

  String getStatusTextColor(String status) {
    switch (status) {
      case 'SCHEDULED':
        return '0xFF2A8EBA';
      case 'COMPLETED':
        return '0xFF2E7D32';
      case 'CANCELLED':
        return '0xFFC62828';
      default:
        return '0xFF2A8EBA';
    }
  }

  @override
  void onClose() {
    companyNameController.dispose();
    roleController.dispose();
    jobDescriptionController.dispose();
    noteController.dispose();
    super.onClose();
  }
}

import 'package:dtc6464/core/services/network_caller.dart';
import 'package:dtc6464/features/interview_planner/model/interviews_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/storage_service.dart';
import '../../../core/utils/constants/api_constants.dart';
import '../../../core/utils/constants/snackbar_constant.dart';


class InterviewPlannerController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    getInterviews();
  }

  final NetworkCaller _networkCaller = Get.find<NetworkCaller>();

  final companyNameController = TextEditingController();
  final roleController = TextEditingController();
  final jobDescriptionController = TextEditingController();
  final noteController = TextEditingController();

  final selectedDate = Rx<DateTime?>(null);
  final selectedTime = Rx<TimeOfDay?>(null);
  final selectedPhase = Rx<String?>('1st Round');

  final oneDayReminderEnabled = true.obs;
  final oneHourReminderEnabled = false.obs;
  final isAddInterviewLoading = false.obs;
  RxBool isInterviewPlansLoading = false.obs;
  RxBool isInterviewPlansError = false.obs;

  Rx<InterviewsModel?> interviews = Rx<InterviewsModel?>(null);

  final interviewPhases = [
    '1st Round',
    '2nd Round',
    '3rd Round',
    'Technical Interview',
    'Behavioral Interview',
    'Final Round',
  ];

  late final DateTime combinedDateTime = DateTime(
    selectedDate.value!.year,
    selectedDate.value!.month,
    selectedDate.value!.day,
    selectedTime.value!.hour,
    selectedTime.value!.minute,
  );

  Future<void> addInterview() async {
    try {
      isAddInterviewLoading.value = true;
      final token = StorageService.accessToken;

      final response = await _networkCaller.postRequest(
        ApiConstant.baseUrl + ApiConstant.addInterview,
        body: {
          "companyName": companyNameController.text,
          "jobTitle": roleController.text,
          "jobDescription": jobDescriptionController.text,
          "interviewDate": selectedDate.value!.toIso8601String(),
          "interviewTime": combinedDateTime.toUtc().toIso8601String(),
          "interviewPhase": selectedPhase.value ?? '',
          "note": noteController.text,
          "oneDayBeforeReminder": oneDayReminderEnabled.value,
          "oneHourBeforeReminder": oneHourReminderEnabled.value,
        }
      );

      if (!response.isSuccess) {
        isAddInterviewLoading.value = false;
        SnackBarConstant.error(title: 'Failed', message: response.errorMessage);
        return;
      }

      isAddInterviewLoading.value = false;
      Get.back();
      getInterviews();
    } catch (e) {
      isAddInterviewLoading.value = false;
      SnackBarConstant.error(title: 'Failed', message: e.toString());
    } finally {
      isAddInterviewLoading.value = false;
    }
  }

  Future<void> getInterviews() async {
    try {
      isInterviewPlansLoading.value = true;
      final token = StorageService.accessToken;
      final response = await _networkCaller.getRequest(
        ApiConstant.baseUrl + ApiConstant.interviewsPlans,
        token: token,
      );

      if(!response.isSuccess) {
        isInterviewPlansLoading.value = false;
        isInterviewPlansError.value = true;
        SnackBarConstant.error(title: 'Failed', message: response.errorMessage);
        return;
      }

      interviews.value = InterviewsModel.fromJson(response.responseData);

      isInterviewPlansLoading.value = false;
      isInterviewPlansError.value = false;
    } catch (e) {
      isInterviewPlansLoading.value = false;
      isInterviewPlansError.value = true;
      SnackBarConstant.error(title: 'Failed', message: e.toString());
    } finally {
      isInterviewPlansLoading.value = false;
    }
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

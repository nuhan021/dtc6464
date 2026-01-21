import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'colors.dart';

class SnackBarConstant {
  SnackBarConstant._();

  // Success SnackBar
  static success({required String title, required String message}) =>
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.success,
        colorText: AppColors.whiteLight,
        margin: EdgeInsets.all(15.w),
        icon: const Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 3),
      );

  // Error SnackBar
  static error({required String title, required String message}) =>
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.error,
        colorText: AppColors.whiteLight,
        margin: EdgeInsets.all(15.w),
        icon: const Icon(Icons.error_outline_rounded, color: Colors.white),
        duration: const Duration(seconds: 4),
      );

  // Warning SnackBar
  static warning({required String title, required String message}) =>
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.warning,
        colorText: AppColors.whiteLight,
        margin: EdgeInsets.all(15.w),
        icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
        duration: const Duration(seconds: 3),
      );
}

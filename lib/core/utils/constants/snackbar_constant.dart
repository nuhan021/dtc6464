import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'colors.dart';

class SnackBarConstant {
  SnackBarConstant._();

  static warning(String title, String message) => Get.snackbar(
    "Required Information",
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: AppColors.softPurpleDarker,
    colorText: AppColors.whiteLight,
    margin: EdgeInsets.all(15.w),
    icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
  );
}

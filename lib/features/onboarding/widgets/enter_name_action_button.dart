import 'package:dtc6464/core/common/styles/global_text_style.dart';
import 'package:dtc6464/core/common/widgets/custom_filled_button.dart';
import 'package:dtc6464/core/utils/constants/colors.dart';
import 'package:dtc6464/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EnterNameActionButton extends StatelessWidget {
  const EnterNameActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFilledButton(
          text: 'Next',
          onPressed: () => Get.toNamed(AppRoute.avatarSelectionScreen),
        ),
        18.verticalSpace,
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            'Back',
            style: getTextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.softPurpleNormal,
            ),
          ),
        ),
      ],
    );
  }
}

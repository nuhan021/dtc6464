import 'package:dtc6464/core/common/widgets/custom_filled_button.dart';
import 'package:dtc6464/features/background/views/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/styles/global_text_style.dart';
import '../../controller/collect_info_controller.dart';
import '../widgets/custom_text_field.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.pageController, required this.controller});

  final CollectInfoController controller;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        children: [
          80.verticalSpace,
          Text(
            'What role are you preparing for?',
            style: getTextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700),
          ).paddingOnly(left: 26.w),

          20.verticalSpace,

          CustomTextField(controller: controller.rolePreparingController, hintText: "e.g., Senior Product Manager")
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
  }
}

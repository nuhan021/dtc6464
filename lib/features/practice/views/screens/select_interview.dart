import 'package:dtc6464/core/common/styles/global_text_style.dart';
import 'package:dtc6464/core/common/widgets/custom_filled_button.dart';
import 'package:dtc6464/core/utils/constants/colors.dart';
import 'package:dtc6464/core/utils/helpers/app_helper.dart';
import 'package:dtc6464/features/background/views/widgets/background.dart';
import 'package:dtc6464/features/practice/views/screens/non_technical_selection.dart';
import 'package:dtc6464/features/practice/views/screens/technical_topic_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/icon_path.dart';
import '../../controller/practice_controller.dart';

class SelectInterview extends StatelessWidget {
  SelectInterview({super.key});

  final PracticeController controller = Get.find<PracticeController>();

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Select Interview Type',
            style: getTextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF333333),
            ),
          ),

          // actions: [
          //   InkWell(
          //     onTap: (){},
          //     child: Image.asset(IconPath.bell, height: 30.h,).paddingOnly(right: 15.w),
          //   )
          // ],
        ),

        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                20.verticalSpace,

                // --- Technical Interview Card ---
                buildInterviewCard(
                  index: 0,
                  icon: IconPath.arrows,
                  title: 'Technical Interview',
                  subtitle: 'Coding challenges, algorithms, system design',
                ),

                20.verticalSpace,

                // --- Non-Technical Interview Card ---
                buildInterviewCard(
                  index: 1,
                  icon: IconPath.users,
                  title: 'Non-Technical / Behavioral Interview',
                  subtitle: 'STAR method, soft skills, past experiences',
                ),

                40.verticalSpace,
                CustomFilledButton(
                  text: "Continue",
                  onPressed: () {
                    if (controller.selectedIndex.value == 0) {
                      AppHelperFunctions.navigateToScreen(
                        context,
                        TechnicalTopicSelection(),
                      );
                    } else {
                      AppHelperFunctions.navigateToScreen(
                        context,
                        NonTechnicalTopicSelection(),
                      );
                    }
                  },
                ),
              ],
            ).paddingSymmetric(horizontal: 16.w),
          ),
        ),
      ),
    );
  }

  Widget buildInterviewCard({
    required int index,
    required String icon,
    required String title,
    required String subtitle,
  }) {
    bool isSelected = controller.selectedIndex.value == index;

    return InkWell(
      onTap: () => controller.selectType(index),
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF6F3FF) : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: const Color(0xFFE4DBFD),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Column(
          children: [
            Image.asset(icon, height: 60.h),
            15.verticalSpace,
            Text(
              title,
              textAlign: TextAlign.center,
              style: getTextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? AppColors.softPurpleNormalActive
                    : const Color(0xFF4A4A6A),
              ),
            ),
            15.verticalSpace,
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: getTextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: isSelected
                    ? AppColors.softPurpleNormalActive
                    : const Color(0xFF6B6B8A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

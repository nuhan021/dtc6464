import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/styles/global_text_style.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../controllers/interview_planner_controller.dart';
import '../../widgets/interview_card.dart';

class InterviewPlannerScreen extends StatelessWidget {
  const InterviewPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InterviewPlannerController());

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70.h,
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Interview Planner',
                style: getTextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF111827),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed('/addInterviewScreen'),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3EFFF),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8.w,
                  children: [
                    Container(
                      width: 28.w,
                      height: 28.w,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.00, 0.50),
                          end: Alignment(1.00, 0.50),
                          colors: [Color(0xFFA78BFA), Color(0xFF7C3AED)],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add, size: 16.w, color: Colors.white),
                    ),
                    Text(
                      'Add',
                      style: getTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF7C3AED),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if(controller.isInterviewPlansLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.softPurpleNormal,
                strokeWidth: 3,
              ),
            );
          }

          if(controller.isInterviewPlansError.value) {
            return Center(
              child: InkWell(
                onTap: () => controller.getInterviews(),
                child: Column(
                  children: [
                    Icon(Icons.refresh),
                    10.verticalSpace,
                    Text('Try Again', style: getTextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),)
                  ],
                ),
              ),
            );
          }
          if (controller.interviews.value == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 80.w,
                    color: const Color(0xFFE4DBFD),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'No interviews scheduled',
                    style: getTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF6D6E6F),
                    ),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12.h,
              children: List.generate(
                controller.interviews.value!.data.length,
                (index) =>
                    InterviewCard(interview: controller.interviews.value!.data[index]),
              ),
            ),
          );
        }),
      ),
    );
  }
}

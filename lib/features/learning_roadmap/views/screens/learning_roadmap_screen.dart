import 'package:dtc6464/features/learning_roadmap/controllers/learning_roadmap_controller.dart';
import 'package:dtc6464/features/learning_roadmap/widgets/week_card.dart';
import 'package:dtc6464/features/learning_roadmap/widgets/your_progress_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LearningRoadmapScreen extends StatelessWidget {
  const LearningRoadmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LearningRoadmapController());

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: Text(
          'Learning Roadmap',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        automaticallyImplyLeading: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 14.h,
          children: [
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const YourProgressSection(),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 14.h,
                children: [
                  Text(
                    '4-Week Interview Prep Plan',
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 14.h,
                    children: List.generate(
                      controller.weekPlans.length,
                      (index) => WeekCard(week: controller.weekPlans[index]),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

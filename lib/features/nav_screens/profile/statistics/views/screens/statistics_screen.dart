import 'package:dtc6464/features/background/views/widgets/background.dart';
import 'package:dtc6464/features/nav_screens/profile/statistics/controllers/statistics_controller.dart';
import 'package:dtc6464/features/nav_screens/profile/statistics/widgets/progress_bar_item.dart';
import 'package:dtc6464/features/nav_screens/profile/statistics/widgets/statistics_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StatisticsController());

    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Statistics',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                28.verticalSpace,
                StatisticsCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Progress',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF4A4A6A),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                      20.verticalSpace,
                      ProgressBarItem(
                        label: 'Overall Progress',
                        value: '${controller.overallProgress.value.toInt()}%',
                        progress: controller.overallProgress.value / 100,
                      ),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Practice Sessions Completed',
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.75,
                            ),
                          ),
                          Text(
                            '${controller.practiceSessionsCompleted.value}',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: const Color(0xFF967DE1),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.75,
                            ),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Average Score',
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.75,
                            ),
                          ),
                          Text(
                            '${controller.averageScore.value}%',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: const Color(0xFF967DE1),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.75,
                            ),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      Center(
                        child: Text(
                          'Keep improving with regular practice',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF2A8EBA),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.75,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                80.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

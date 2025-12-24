import 'package:dtc6464/features/background/views/widgets/background.dart';
import 'package:dtc6464/features/nav_screens/profile/history/controllers/history_controller.dart';
import 'package:dtc6464/features/nav_screens/profile/history/widgets/empty_state_widget.dart';
import 'package:dtc6464/features/nav_screens/profile/history/widgets/history_tab_button.dart';
import 'package:dtc6464/features/nav_screens/profile/history/widgets/planner_card.dart';
import 'package:dtc6464/features/nav_screens/profile/history/widgets/practice_session_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryController());

    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'History',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                28.verticalSpace,
                // Tab Buttons
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    spacing: 8.w,
                    children: [
                      Expanded(
                        child: Obx(
                          () => HistoryTabButton(
                            label: 'practice Sessions',
                            isActive: controller.activeTab.value == 0,
                            onPressed: () => controller.switchTab(0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => HistoryTabButton(
                            label: 'Planner',
                            isActive: controller.activeTab.value == 1,
                            onPressed: () => controller.switchTab(1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                // Tab Content
                Obx(() {
                  if (controller.activeTab.value == 0) {
                    // Practice Sessions Tab
                    if (controller.practiceSessionList.isEmpty) {
                      return EmptyStateWidget(
                        title: 'No Practice Session yet',
                        subtitle: 'Complete a practice session to see it here',
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        spacing: 20.h,
                        children: [
                          ...controller.practiceSessionList.map(
                            (session) => PracticeSessionCard(
                              title: session.title,
                              dateTime: session.dateTime,
                              scoreOrStatus: session.scoreOrStatus,
                              isScore: session.isScore,
                              onViewFeedback: () =>
                                  controller.viewFeedback(session.title),
                            ),
                          ),
                          80.verticalSpace,
                        ],
                      ),
                    );
                  } else {
                    // Planner Tab
                    if (controller.plannerList.isEmpty) {
                      return EmptyStateWidget(
                        title: 'No Planner Items yet',
                        subtitle: 'Schedule an interview to see it here',
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        spacing: 16.h,
                        children: [
                          ...controller.plannerList.map(
                            (item) => PlannerCard(
                              title: item.title,
                              dateAndRound: item.dateAndRound,
                              status: item.status,
                            ),
                          ),
                          80.verticalSpace,
                        ],
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

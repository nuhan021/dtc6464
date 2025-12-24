import 'package:dtc6464/core/utils/constants/icon_path.dart';
import 'package:dtc6464/features/background/views/widgets/background.dart';
import 'package:dtc6464/features/nav_screens/profile/notifications/controllers/notifications_controller.dart';
import 'package:dtc6464/features/nav_screens/profile/notifications/widgets/notification_toggle_item.dart';
import 'package:dtc6464/features/nav_screens/profile/notifications/widgets/notifications_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationsController());

    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Notifications',
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
                NotificationsCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 24.h,
                    children: [
                      Obx(
                        () => NotificationToggleItem(
                          title: 'Practice reminders',
                          subtitle: 'Get daily reminders to practice',
                          backgroundColor: const Color(0x19A896E6),
                          iconPath: IconPath.practiceReminderIcon,
                          isEnabled: controller.practiceReminders.value,
                          onToggle: controller.togglePracticeReminders,
                        ),
                      ),
                      Obx(
                        () => NotificationToggleItem(
                          title: 'Interview reminders',
                          subtitle: 'Reminders before scheduled interviews',
                          backgroundColor: const Color(0x4CB8D4F1),
                          iconPath: IconPath.interviewReminderIcon,
                          isEnabled: controller.interviewReminders.value,
                          onToggle: controller.toggleInterviewReminders,
                        ),
                      ),
                      Obx(
                        () => NotificationToggleItem(
                          title: 'Weekly progress summary',
                          subtitle: 'Get weekly reports on your progress',
                          backgroundColor: const Color(0x4CB8E6D5),
                          iconPath: IconPath.weeklyProgressIcon,
                          isEnabled: controller.weeklyProgressSummary.value,
                          onToggle: controller.toggleWeeklyProgressSummary,
                        ),
                      ),
                      Obx(
                        () => NotificationToggleItem(
                          title: 'Tips & recommendations',
                          subtitle:
                              'Receive helpful tips and personalized advice',
                          backgroundColor: const Color(0x66E6D4F1),
                          iconPath: IconPath.tipsIcon,
                          isEnabled: controller.tipsRecommendations.value,
                          onToggle: controller.toggleTipsRecommendations,
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

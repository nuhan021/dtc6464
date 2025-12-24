import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/styles/global_text_style.dart';
import '../../controllers/view_notifications_controller.dart';
import '../../widgets/notification_card.dart';

class ViewNotificationsScreen extends StatelessWidget {
  const ViewNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ViewNotificationsController());

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Notifications',
          style: getTextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF333333),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Mark all as read button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => controller.markAllAsRead(),
                    child: Text(
                      'Mark all as read',
                      style: getTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF2D97C6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Notifications list
            Expanded(
              child: Obx(
                () => SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8.h,
                    children: List.generate(
                      controller.notifications.length,
                      (index) => NotificationCardWidget(
                        notification: controller.notifications[index],
                        onTap: () => controller.markAsRead(
                          controller.notifications[index].id,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

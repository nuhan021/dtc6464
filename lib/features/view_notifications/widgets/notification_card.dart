import 'package:dtc6464/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/styles/global_text_style.dart';
import '../controllers/view_notifications_controller.dart';

class NotificationCardWidget extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap;

  const NotificationCardWidget({
    super.key,
    required this.notification,
    required this.onTap,
  });

  IconData _getIconData(String iconType) {
    switch (iconType) {
      case 'bell':
        return Icons.notifications;
      case 'calendar':
        return Icons.event;
      case 'trend':
        return Icons.trending_up;
      case 'bulb':
        return Icons.lightbulb;
      case 'target':
        return Icons.public;
      case 'chat':
        return Icons.chat;
      default:
        return Icons.notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = Color(int.parse(notification.backgroundColor));

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFA0A0C8).withValues(alpha: 0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12.w,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 12.w,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon background
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: bgColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        _getIconData(notification.iconType),
                        size: 20.w,
                        color: AppColors.softPurpleNormal,
                      ),
                    ),
                  ),
                  // Title and description
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4.h,
                      children: [
                        Text(
                          notification.title,
                          style: getTextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF4A4A6A),
                          ),
                        ),
                        Text(
                          notification.description,
                          style: getTextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF9B9BAA),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Time
            Text(
              notification.timeAgo,
              style: getTextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFA78BFA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

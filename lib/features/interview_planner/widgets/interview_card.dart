import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/common/styles/global_text_style.dart';
import '../controllers/interview_planner_controller.dart';

class InterviewCard extends StatelessWidget {
  final Interview interview;

  const InterviewCard({super.key, required this.interview});

  @override
  Widget build(BuildContext context) {
    final controller = InterviewPlannerController();
    final initials = controller.getAvatarInitials(interview.companyName);
    final statusBgColor = Color(
      int.parse(controller.getStatusColor(interview.status)),
    );
    final statusTextColor = Color(
      int.parse(controller.getStatusTextColor(interview.status)),
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE4DBFD).withValues(alpha: 0.6),
            blurRadius: 10,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 30.h,
        children: [
          // Header with avatar, company info, and status
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12.h,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 12.w,
                      children: [
                        Container(
                          width: 54.w,
                          height: 54.w,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment(0.00, 0.50),
                              end: Alignment(1.00, 0.50),
                              colors: [Color(0xFFA78BFA), Color(0xFF5734C0)],
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.25),
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              initials,
                              textAlign: TextAlign.center,
                              style: getTextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 2.h,
                            children: [
                              Text(
                                interview.companyName,
                                overflow: TextOverflow.ellipsis,
                                style: getTextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF111827),
                                ),
                              ),
                              Text(
                                interview.role,
                                overflow: TextOverflow.ellipsis,
                                style: getTextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF6D6E6F),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: statusBgColor,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Text(
                      interview.status,
                      style: getTextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: statusTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              // Date, Round, Reminder info
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 6.w,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 12.w,
                        color: const Color(0xFF929294),
                      ),
                      Flexible(
                        child: Text(
                          DateFormat(
                            'MMM dd, yyyy \'at\' hh:mm a',
                          ).format(interview.interviewDate),
                          overflow: TextOverflow.ellipsis,
                          style: getTextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF929294),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8.w,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 12.w,
                        color: const Color(0xFF929294),
                      ),
                      Flexible(
                        child: Text(
                          interview.round,
                          overflow: TextOverflow.ellipsis,
                          style: getTextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF929294),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 6.w,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 12.w,
                        color: const Color(0xFF929294),
                      ),
                      Flexible(
                        child: Text(
                          'Reminder: ${interview.reminder}',
                          overflow: TextOverflow.ellipsis,
                          style: getTextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF929294),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // Progress section
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12.h,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Preparation Progress',
                    style: getTextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  Text(
                    '${(interview.preparationProgress * 100).toInt()}%',
                    style: getTextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF8A5CF6),
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: LinearProgressIndicator(
                  value: interview.preparationProgress,
                  minHeight: 6.h,
                  backgroundColor: const Color(0xFFE4DBFD),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFFA78BFA),
                  ),
                ),
              ),
            ],
          ),
          // Action buttons
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8.w,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE4DBFD),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8.w,
                      children: [
                        // Icon(
                        //   Icons.swap_horiz,
                        //   size: 14.w,
                        //   color: const Color(0xFF8A5CF6),
                        // ),
                        Flexible(
                          child: Text(
                            'Change Status',
                            overflow: TextOverflow.ellipsis,
                            style: getTextStyle(
                              // fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF8A5CF6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(0.00, 0.50),
                        end: Alignment(1.00, 0.50),
                        colors: [Color(0xFFA78BFA), Color(0xFF5734C0)],
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8.w,
                      children: [
                        // Icon(Icons.play_arrow, size: 14.w, color: Colors.white),
                        Flexible(
                          child: Text(
                            'Start practice',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: getTextStyle(
                              // fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

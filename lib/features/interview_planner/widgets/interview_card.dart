import 'package:dtc6464/features/interview_planner/model/interviews_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/interview_planner_controller.dart';
import './interview_card_action_buttons.dart';
import './interview_card_header.dart';
import './interview_card_info_section.dart';
import './interview_card_progress_section.dart';

class InterviewCard extends StatelessWidget {
  final Datum interview;

  const InterviewCard({super.key, required this.interview});

  @override
  Widget build(BuildContext context) {
    final controller = InterviewPlannerController();
    final initials = controller.getAvatarInitials(interview.companyName);
    final statusBgColor = Color(
      int.parse(controller.getStatusColor("SCHEDULED")),
    );
    final statusTextColor = Color(
      int.parse(controller.getStatusTextColor("SCHEDULED")),
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
          InterviewCardHeader(
            companyName: interview.companyName,
            role: interview.jobTitle,
            initials: initials,
            status: 'panding',
            statusBgColor: statusBgColor,
            statusTextColor: statusTextColor,
          ),
          // Date, Round, Reminder info
          InterviewCardInfoSection(
            interviewDate: interview.interviewDate,
            round: interview.interviewPhase,
            reminderBeforeOneDay: interview.oneDayBeforeReminder,
            reminderBeforeOneHour: interview.oneHourBeforeReminder,
          ),
          // Progress section
          InterviewCardProgressSection(preparationProgress: 0.4),
          // Action buttons
          InterviewCardActionButtons(
            onChangeStatus: () {},
            onStartPractice: () {},
          ),
        ],
      ),
    );
  }
}

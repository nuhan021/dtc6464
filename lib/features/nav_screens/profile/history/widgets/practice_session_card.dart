import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PracticeSessionCard extends StatelessWidget {
  final String title;
  final String dateTime;
  final String scoreOrStatus;
  final bool isScore;
  final VoidCallback onViewFeedback;

  const PracticeSessionCard({
    required this.title,
    required this.dateTime,
    required this.scoreOrStatus,
    required this.isScore,
    required this.onViewFeedback,
    super.key,
  });

  Color _getScoreBgColor() {
    if (!isScore) return const Color(0xFFCBEFE9); // Completed - green
    final scoreStr = scoreOrStatus
        .replaceAll('Score: ', '')
        .replaceAll('%', '');
    final score = int.tryParse(scoreStr) ?? 0;
    if (score >= 90) return const Color(0xFFE1EAED); // 92% - teal
    if (score >= 80) return const Color(0xFFE1F5FE); // 85% - blue
    return const Color(0xFFFEF2F9); // 78% - pink
  }

  Color _getScoreTextColor() {
    if (!isScore) return const Color(0xFF34C759); // Completed - green
    final scoreStr = scoreOrStatus
        .replaceAll('Score: ', '')
        .replaceAll('%', '');
    final score = int.tryParse(scoreStr) ?? 0;
    if (score >= 90) return const Color(0xFF295866); // teal
    if (score >= 80) return const Color(0xFF2A8EBA); // blue
    return const Color(0xFFBB7E9F); // pink
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x19A0A0C8),
            blurRadius: 12.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: const Color(0xFF3A3158),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.75,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      dateTime,
                      style: TextStyle(
                        color: const Color(0xFF929294),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.75,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: _getScoreBgColor(),
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Text(
                  scoreOrStatus,
                  style: TextStyle(
                    color: _getScoreTextColor(),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.75,
                  ),
                ),
              ),
            ],
          ),
          6.verticalSpace,
          GestureDetector(
            onTap: onViewFeedback,
            child: Text(
              'View Feedback',
              style: TextStyle(
                color: const Color(0xFF967DE1),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1.75,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

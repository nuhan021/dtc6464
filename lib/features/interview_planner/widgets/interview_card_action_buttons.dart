import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/styles/global_text_style.dart';

class InterviewCardActionButtons extends StatelessWidget {
  final VoidCallback onChangeStatus;
  final VoidCallback onStartPractice;

  const InterviewCardActionButtons({
    super.key,
    required this.onChangeStatus,
    required this.onStartPractice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onChangeStatus,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: const Color(0xFFE4DBFD),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8.w,
                children: [
                  Flexible(
                    child: Text(
                      'Change Status',
                      overflow: TextOverflow.ellipsis,
                      style: getTextStyle(
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
            onTap: onStartPractice,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
                spacing: 8.w,
                children: [
                  Flexible(
                    child: Text(
                      'Start practice',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: getTextStyle(
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
    );
  }
}

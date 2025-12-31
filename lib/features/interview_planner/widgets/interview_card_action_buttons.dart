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
                  // begin and end points approximate the 114-degree angle
                  begin: Alignment(-0.7, -0.8),
                  end: Alignment(0.7, 0.8),
                  colors: [
                    Color(0xFFA78BFA), // #A78BFA at 15.41%
                    Color(0xFF5835C0), // #5835C0 at 84.59%
                  ],
                  // stops define the exact percentages for the color transition
                  stops: [0.1541, 0.8459],
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

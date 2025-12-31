import 'package:dtc6464/core/common/styles/global_text_style.dart';
import 'package:dtc6464/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/icon_path.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isIcon = false,
    this.icon = IconPath.arrowRightFilled,
    this.gradient,
    this.color,
    this.textColor,
  });

  final String text;
  final VoidCallback onPressed;
  final bool? isIcon;
  final String icon;
  final Gradient? gradient;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final effectiveGradient = gradient ?? const LinearGradient(
      begin: Alignment(-0.7, -0.8), // Approx 114 degrees
      end: Alignment(0.7, 0.8),
      colors: [
        Color(0xFFA78BFA), // #A78BFA (15.41%)
        Color(0xFF5835C0), // #5835C0 (84.59%)
      ],
      stops: [0.1541, 0.8459],
    );
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(60.r),
          gradient: color != null ? null : effectiveGradient,
          // 2. The Box Shadow
          boxShadow: [
            // BoxShadow(
            //   color: const Color(0xFFA896E6).withOpacity(0.12),
            //   offset: const Offset(0, 10),
            //   blurRadius: 20,
            //   spreadRadius: 0,
            // ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // text
            Text(
              text,
              style: getTextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: textColor ?? AppColors.whiteLight,
              ),
            ),

            10.horizontalSpace,

            if(isIcon ?? false)
              Image.asset(icon, width: 20.w,)
          ],
        ),
      ),
    );
  }
}

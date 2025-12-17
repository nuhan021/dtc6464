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
  });

  final String text;
  final VoidCallback onPressed;
  final bool? isIcon;
  final String icon;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final effectiveGradient = gradient ?? const LinearGradient(
      begin: Alignment(-0.7, -0.6),
      end: Alignment(0.7, 0.6),
      colors: [
        Color(0xFFA78BFA),
        Color(0xFF5835C0),
      ],
      stops: [0.1541, 0.8459],
    );
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.r),
          gradient: effectiveGradient,
          // 2. The Box Shadow
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFA896E6).withOpacity(0.12),
              offset: const Offset(0, 10),
              blurRadius: 20,
              spreadRadius: 0,
            ),
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
                color: AppColors.whiteLight,
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

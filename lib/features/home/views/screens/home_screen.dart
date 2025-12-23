import 'package:dtc6464/core/common/styles/global_text_style.dart';
import 'package:dtc6464/core/common/widgets/custom_filled_button.dart';
import 'package:dtc6464/core/utils/constants/colors.dart';
import 'package:dtc6464/core/utils/constants/icon_path.dart';
import 'package:dtc6464/features/background/views/widgets/background.dart';
import 'package:dtc6464/features/home/views/widgets/quick_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, 80.h),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: false,
            title: Text(
              'Welcome back!',
              style: getTextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.softPurpleDarker,
              ),
            ),
            actions: [
              InkWell(onTap: () {}, child: Image.asset(IconPath.notification)),
            ],
            bottom: PreferredSize(
              preferredSize: Size(double.maxFinite, 30.h),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Ready to ace your next interview?',
                  style: getTextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.softPurpleDarkerHover,
                  ),
                ).paddingOnly(left: 16.w),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.verticalSpace,

              // Quick Actions
              QuickAction(),

              20.verticalSpace,

              Practice(),

              20.verticalSpace,

              Progress(),

              20.verticalSpace,

              Text(
                'Recent Activity',
                style: getTextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),

              12.verticalSpace,

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  color: Colors.white,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: AppColors.softPurpleNormal, size: 18.h,),
                        10.horizontalSpace,
                        Expanded(
                          child: Text(
                            'Practice Session Completed',
                            overflow: TextOverflow.ellipsis,
                            style: getTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.softPurpleNormalHover
                            ),
                          ),
                        )
                      ],
                    ),

                    4.verticalSpace,

                    Text(
                      '2 hours ago',
                      style: getTextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGreyNormal
                      ),
                    ).paddingOnly(left: 27.w),

                    7.verticalSpace,

                    Text(
                      'Behavioral Questions - Score:85%',
                      style: getTextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF555556)
                      ),
                    ).paddingOnly(left: 27.w),
                  ],
                ),
              ),

              20.verticalSpace,

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFC8B4DC).withOpacity(0.12),
                      offset: const Offset(0, 8),
                      blurRadius: 16,
                      spreadRadius: 0,
                    ),
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFFC7EEFF),
                      Color(0xFFDFF5FF),
                    ],
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 48.h,
                      width: 48.w,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(IconPath.bulb, color: AppColors.softBlueNormal,),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today's Tip",
                            style: getTextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF4A4A6A)
                            ),
                          ),

                          5.verticalSpace,

                          Text(
                            "Use measurable results in your STAR answers.",
                            style: getTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF4A4A6A)
                            ),
                          ),

                          8.verticalSpace,

                          Text(
                            "Example: Reduced processing time by 40%...",
                            style: getTextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF6B6B8A)
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              60.verticalSpace,

            ],
          ).paddingSymmetric(horizontal: 16.w),
        ),
      ),
    );
  }
}

class Practice extends StatelessWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA896E6).withOpacity(0.15),
            offset: const Offset(0, 8),
            blurRadius: 16,
            spreadRadius: 0,
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.205, 0.8352],
          colors: [Color(0xFFF6F3FF), Color(0xFFE5DDFF)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Continue Practice',
            style: getTextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF4A4A6A),
            ),
          ),

          7.verticalSpace,

          Text(
            'You left off at: Behavioral Interview - Question 4 of 10',
            style: getTextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF4A4A6A),
            ),
          ),

          12.verticalSpace,

          Stack(
            children: [
              Container(
                height: 8.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.white,
                ),
              ),

              LayoutBuilder(
                builder: (context, constraints) {
                  double progressPercentage = 0.5;

                  return Container(
                    height: 8.h,
                    width: constraints.maxWidth * progressPercentage,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: const Color(0xFFA896E6),
                    ),
                  );
                },
              ),
            ],
          ),

          12.verticalSpace,

          Text(
            '40% Complete',
            style: getTextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF6B6B8A),
            ),
          ),

          12.verticalSpace,

          Container(
            height: 45.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.softPurpleNormal,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Resume Session',
                  style: getTextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

                5.horizontalSpace,

                Image.asset(IconPath.arrowRightFilled, width: 18.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Progress',
          style: getTextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),

        12.verticalSpace,

        Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.476, 1.0],
              colors: [Color(0xFF5A6BFF), Color(0xFF7A86FF), Color(0xFF8A5CF6)],
            ),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '12',
                      style: getTextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),

                    5.verticalSpace,

                    Text(
                      'Your Score',
                      style: getTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Colors.white,
                      width: 2.w,
                    ),
                    right: BorderSide(
                      color: Colors.white,
                      width: 2.w,
                    ),
                  )
                ),
                child: Column(
                  children: [
                    Text(
                      '74%',
                      style: getTextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),

                    5.verticalSpace,

                    Text(
                      'Avg Score',
                      style: getTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '5',
                      style: getTextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),

                    5.verticalSpace,

                    Text(
                      'Streak',
                      style: getTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



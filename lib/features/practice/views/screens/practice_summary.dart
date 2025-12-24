import 'package:dtc6464/core/utils/constants/colors.dart';
import 'package:dtc6464/features/background/views/widgets/background.dart';
import 'package:dtc6464/features/practice/views/screens/select_interview.dart';
import 'package:dtc6464/features/practice/views/screens/view_detailed_feedback_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/styles/global_text_style.dart';
import '../../../../core/common/widgets/custom_filled_button.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/helpers/app_helper.dart';

class PracticeSummary extends StatelessWidget {
  const PracticeSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          title: Text(
            'Practice Summary',
            style: getTextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF333333),
            ),
          ),

          actions: [
            InkWell(
              onTap: () {},
              child: Image.asset(
                IconPath.bell,
                height: 30.h,
              ).paddingOnly(right: 15.w),
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              20.verticalSpace,

              // identifier
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: const Color(0xFFA896E6).withOpacity(0.30),
                        width: 1.108,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft, // 90deg
                        end: Alignment.centerRight,
                        colors: [
                          const Color(0xFFA896E6).withOpacity(0.20),
                          const Color(0xFFB8D4F1).withOpacity(0.20),
                        ],
                      ),
                    ),
                    child: Text(
                      "Technical Interview",
                      style: getTextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF4A4A6A),
                      ),
                    ),
                  ),

                  10.horizontalSpace,

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: const Color(0xFFA896E6).withOpacity(0.30),
                        width: 1.108,
                      ),
                      color: Colors.white,
                    ),
                    child: Text(
                      "Coding Round",
                      style: getTextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF4A4A6A),
                      ),
                    ),
                  ),
                ],
              ),

              40.verticalSpace,

              // score
              Container(
                height: 140.h,
                width: 140.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF38BDF8).withOpacity(0.40),
                      offset: const Offset(0, 4),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment(-0.81, -0.59),
                    end: Alignment(0.81, 0.59),
                    stops: [-0.1206, 0.8995],
                    colors: [Color(0xFF72D3FF), Color(0xFF00A3EA)],
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  '8.5/10',
                  style: getTextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),

              20.verticalSpace,

              Text(
                'Overall Performance',
                style: getTextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.softPurpleNormal
                ),
              ),

              110.verticalSpace,

              // strength
              Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF8A5CF6).withOpacity(0.20),
                        offset: const Offset(0, 0),
                        blurRadius: 12,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 32.h,
                          width: 32.w,
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(37170400.r),
                            color: const Color(0xFFE4DBFD),
                          ),
                          child: Image.asset(IconPath.strength,),
                        ),

                        12.horizontalSpace,

                        Text(
                          'Strengths',
                          style: getTextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.softPurpleNormalHover
                          ),
                        )
                      ],
                    ),

                    15.verticalSpace,

                    for(int i = 0; i < 3; i++)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 7.h,
                          width: 7.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF8A5CF6),
                          ),
                        ).paddingOnly(top: 7.h),

                        15.horizontalSpace,

                        Expanded(
                          child: Text(
                            'Clear and structured responses with good examples.',
                            style: getTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.softPurpleNormalHover
                            ),
                          ),
                        )
                      ],
                    ).paddingOnly(left: 10.w).paddingOnly(bottom: 10.h)
                  ],
                ),
              ),

              10.verticalSpace,

              // improve
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8A5CF6).withOpacity(0.20),
                      offset: const Offset(0, 0),
                      blurRadius: 12,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 32.h,
                          width: 32.w,
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(37170400.r),
                            color: const Color(0xFFC1EBFD),
                          ),
                          child: Image.asset(IconPath.bulbUpdated,),
                        ),

                        12.horizontalSpace,

                        Text(
                          'Strengths',
                          style: getTextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.softPurpleNormalHover
                          ),
                        )
                      ],
                    ),

                    15.verticalSpace,

                    for(int i = 0; i < 3; i++)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 7.h,
                            width: 7.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF8A5CF6),
                            ),
                          ).paddingOnly(top: 7.h),

                          15.horizontalSpace,

                          Expanded(
                            child: Text(
                              'Clear and structured responses with good examples.',
                              style: getTextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.softPurpleNormalHover
                              ),
                            ),
                          )
                        ],
                      ).paddingOnly(left: 10.w).paddingOnly(bottom: 10.h)
                  ],
                ),
              ),

              110.verticalSpace,

              CustomFilledButton(
                text: 'View Detailed Feedback',
                gradient: const LinearGradient(
                  begin: Alignment(-0.81, -0.59),
                  end: Alignment(0.81, 0.59),
                  stops: [-0.1206, 0.8995],
                  colors: [Color(0xFF72D3FF), Color(0xFF00A3EA)],
                ),
                onPressed: () {
                  AppHelperFunctions.navigateToScreen(context, ViewDetailedFeedbackScreen());
                },
              ).paddingSymmetric(horizontal: 35.w),

              20.verticalSpace,

              CustomFilledButton(
                text: 'Practice Again',
                onPressed: () {
                  Navigator.pop(context);
                },
              ).paddingSymmetric(horizontal: 35.w),

              10.verticalSpace,

              TextButton(onPressed: (){
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SelectInterview()),
                      (route) => false,
                );
              }, child: Text(
                'Back To Home',
                style: getTextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.softPurpleNormalActive
                ),
              )),

              60.verticalSpace,
            ],
          ).paddingSymmetric(horizontal: 16.w),
        ),
      ),
    );
  }
}

import 'package:dtc6464/core/common/widgets/custom_filled_button.dart';
import 'package:dtc6464/features/background/views/widgets/background.dart';
import 'package:dtc6464/features/practice/views/screens/select_interview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/styles/global_text_style.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/icon_path.dart';

class ViewDetailedFeedbackScreen extends StatelessWidget {
  const ViewDetailedFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(child: Scaffold(
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

            // interview question
            Container(
              width: double.infinity,
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
                      Image.asset(IconPath.question, height: 25.h),
                      12.horizontalSpace,
                      Text(
                        'Question',
                        style: getTextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.softPurpleNormalHover,
                        ),
                      ),
                    ],
                  ),

                  10.verticalSpace,

                  Text(
                    'Describe a challenging project and how you managed it.',
                    style: getTextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.softPurpleDark,
                    ),
                  ),
                ],
              ),
            ),

            20.verticalSpace,

            // Your Response
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
                          color: AppColors.softBlueActiveLight,
                        ),
                        child: Image.asset(IconPath.strength, color: AppColors.softBlueNormalHover,),
                      ),

                      12.horizontalSpace,

                      Text(
                        'Your Response',
                        style: getTextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.softBlueNormal
                        ),
                      )
                    ],
                  ),

                  15.verticalSpace,

                  Text(
                    'I worked on a mobile app project with tight deadlines. I organized the team, broke down tasks, and held daily check-ins. We completed it on time and the client was happy with the results.',
                    style: getTextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                    ),
                  )
                ],
              ),
            ),

            20.verticalSpace,

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
                  for(int i = 0; i < 3; i++)
                   ClarityCard().paddingOnly(bottom: 20.h),
                ],
              ),
            ),

            20.verticalSpace,

            // Your Response
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: const Color(0xFFFFCBA9),
                  width: 1,
                ),

                // 3. Background: linear-gradient(180deg, rgba(255, 221, 200, 0.50) 0%, rgba(255, 236, 195, 0.50) 100%)
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFFFDDC8).withOpacity(0.50), // rgba(255, 221, 200, 0.50)
                    const Color(0xFFFFECC3).withOpacity(0.50), // rgba(255, 236, 195, 0.50)
                  ],
                ),

                // 4. Box Shadow: 0 8px 16px 0 rgba(200, 180, 220, 0.12)
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFC8B4DC).withOpacity(0.12), // rgba(200, 180, 220, 0.12)
                    offset: const Offset(0, 8),  // x: 0, y: 8
                    blurRadius: 16,             // blur: 16
                    spreadRadius: 0,            // spread: 0
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
                          color: Colors.white,
                        ),
                        child: Image.asset(IconPath.bulb, color: const Color(0xFFF97316),),
                      ),

                      12.horizontalSpace,

                      Text(
                        'Suggestions',
                        style: getTextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF4B5563)
                        ),
                      )
                    ],
                  ),

                  15.verticalSpace,

                  for(int i = 0; i < 3; i++)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${i+1}.  ',
                        style: getTextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF4B5563)
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Add specific metrics: mention team size, timeline, or measurable outcomes (e.g., "20% under budget")',
                          style: getTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF4B5563)
                          ),
                        ),
                      ),
                    ],
                  ).paddingOnly(left: 40.w, bottom: 10.h)
                ],
              ),
            ),

            20.verticalSpace,

            // Your Response
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter, // 0deg
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xFFE6DFFF),
                    Color(0xFFF0EBFF),
                  ],
                ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 32.h,
                        width: 32.w,
                        padding: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(37170400.r),
                          color: const Color(0xFFA896E6).withOpacity(0.3),
                        ),
                        child: Image.asset(IconPath.ai2, color: const Color(0xFFA896E6),),
                      ),

                      12.horizontalSpace,

                      Expanded(
                        child: Text(
                          'Sample Improved Answer',
                          style: getTextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF4B5563)
                          ),
                        ),
                      )
                    ],
                  ),

                  15.verticalSpace,

                  for(int i = 0; i < 4; i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Situation',
                        style: getTextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF4A4A6A)
                        ),
                      ),


                      Text(
                        'I led a mobile app development project with a 6-week deadline for a major retail client.',
                        style: getTextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF6B6B8A)
                        ),
                      )
                    ],
                  ).paddingOnly(left: 45.w, bottom: 10.h),
                ],
              ),
            ),


            40.verticalSpace,
            
            CustomFilledButton(text: 'Practice Next Question', onPressed: (){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SelectInterview()),
                    (route) => false,
              );
            }).paddingSymmetric(horizontal: 36.w),

            40.verticalSpace,

          ],
        ).paddingSymmetric(horizontal: 16.w),
      ),
    ));
  }
}


class ClarityCard extends StatelessWidget {
  const ClarityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 7.h,
                  width: 7.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF22262D)
                  ),
                ),

                8.horizontalSpace,

                Text(
                  'Clarity',
                  style: getTextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                      color: const Color(0xFF22262D)
                  ),
                ),
              ],
            ),

            Row(
              children: [
                for(int i = 0; i < 5; i++)
                Container(
                  height: 7.h,
                  width: 7.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.r),
                    color: i == 4 ? const Color(0xFFC7CACF) : const Color(0xFF367588)
                  ),
                ).paddingOnly(right: 5.w),

                Text(
                  '4/5',
                  style: getTextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF367588)
                  ),
                )
              ],
            )
          ],
        ),

        10.verticalSpace,

        Text(
          'Your message was clear and easy to follow. Good use of straightforward language.',
          style: getTextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF4B5563)
          ),
        )
      ],
    );
  }
}

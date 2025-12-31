import 'package:dtc6464/core/common/widgets/custom_filled_button.dart';
import 'package:dtc6464/core/utils/constants/colors.dart';
import 'package:dtc6464/core/utils/helpers/app_helper.dart';
import 'package:dtc6464/features/background/views/widgets/background.dart';
import 'package:dtc6464/features/practice/controller/practice_controller.dart';
import 'package:dtc6464/features/practice/views/screens/practice_summary.dart';
import 'package:dtc6464/features/practice/views/screens/select_interview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/styles/global_text_style.dart';
import '../../../../core/utils/constants/icon_path.dart';

class AiCoachMode extends StatelessWidget {
  AiCoachMode({super.key});

  final PracticeController controller = Get.find<PracticeController>();

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Al Coach Mode',
            style: getTextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF333333),
            ),
          ),

          // actions: [
          //   InkWell(
          //     onTap: () {},
          //     child: Image.asset(
          //       IconPath.bell,
          //       height: 30.h,
          //     ).paddingOnly(right: 15.w),
          //   ),
          // ],
        ),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                          'Interview Question',
                          style: getTextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.softBlueNormal,
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

                    12.verticalSpace,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h), // Adjust padding as needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: const Color(0xFFE4DBFD),
                          ),
                          child: Row(
                            children: [
                              Image.asset(IconPath.microphone, height: 18.h, color: const Color(0xFF866FC8),),
                              5.horizontalSpace,
                              Text(
                                'Play Audio',
                                style: getTextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF2D333B)
                                ),
                              )
                            ],
                          ),
                        ),
                        10.horizontalSpace,
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h), // Adjust padding as needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: const Color(0xFFFFEDE2),
                          ),
                          child: Row(
                            children: [
                              Image.asset(IconPath.bulb, height: 18.h, color: const Color(0xFFF97316),),
                              5.horizontalSpace,
                              Text(
                                'Details',
                                style: getTextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF2D333B)
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              25.verticalSpace,

              Obx(() {
                if (controller.inputType.value == 'type') {
                  return Column(
                    children: [
                      Container(
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
                        child: TextField(
                          maxLines: 7,
                          minLines: 7,
                          style: getTextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xFF333333),
                          ),
                          decoration: InputDecoration(
                            hintText: "Type your answer here...",
                            hintStyle: getTextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFFA0A0C8),
                            ),
                            contentPadding: EdgeInsets.all(16.w),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),

                      Obx(() => controller.inputType.value == 'type' ? 20.verticalSpace : 0.verticalSpace),


                      CustomFilledButton(
                        text: 'Submit Answer',
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,    // 0% - #FFDDC8
                          end: Alignment.bottomCenter, // 100% - #FFECC3
                          colors: [
                            Color(0xFFFFDDC8),
                            Color(0xFFFFECC3),
                          ],
                        ),
                        textColor: const Color(0xFFF97316),
                        onPressed: () {
                          AppHelperFunctions.navigateToScreen(
                            context,
                            PracticeSummary(),
                          );
                        },
                      ).paddingSymmetric(horizontal: 35.w),
                    ],
                  );
                }
                return VoiceNote(controller: controller);
              }),

              Obx(() => controller.inputType.value == 'type' ? 20.verticalSpace : 0.verticalSpace),

              CustomFilledButton(
                text: 'End Practice',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SelectInterview()),
                        (route) => false,
                  );
                },
              ).paddingSymmetric(horizontal: 35.w),

              20.verticalSpace,

              Obx(() {
                return TextButton(
                  onPressed: () {
                    if (controller.inputType.value == "voice") {
                      controller.inputType.value = "type";
                    } else {
                      controller.inputType.value = "voice";
                    }
                  },
                  child: Text(
                    controller.inputType.value == "voice"
                        ? 'Prefer typing instead?'
                        : 'Prefer voice instead?',
                    style: getTextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.softPurpleNormalActive,
                    ),
                  ),
                );
              }),







              30.verticalSpace,
            ],
          ).paddingSymmetric(horizontal: 16.w),
        ),
      ),
    );
  }
}

class VoiceNote extends StatelessWidget {
  const VoiceNote({super.key, required this.controller});

  final PracticeController controller;

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isVoice = controller.inputType.value == 'voice';
      // রেকর্ডিং ফাইল আছে কি না এবং এখন রেকর্ডিং চলছে কি না তা চেক করা হচ্ছে
      bool hasRecording = controller.recordedPath.value.isNotEmpty && !controller.isRecording.value;

      return Column(
        children: [
          Text(
            isVoice ? 'Hold the microphone and start answering' : 'Type your answer below',
            textAlign: TextAlign.center,
            style: getTextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.softPurpleDark,
            ),
          ),
          20.verticalSpace,

          if (isVoice) ...[
            // --- VOICE MODE UI ---
            SizedBox(
              height: 240.h,
              width: 240.h,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  if (controller.isRecording.value)
                    ...List.generate(3, (index) {
                      double rippleSize = 140.h + (controller.amplitude.value * 90.h * (index + 0.5));
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        height: rippleSize,
                        width: rippleSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF8A5CF6).withOpacity(
                            (0.2 - (index * 0.05)).clamp(0.0, 1.0),
                          ),
                        ),
                      );
                    }),
                  GestureDetector(
                    onLongPress: () => controller.startRecording(),
                    onLongPressUp: () => controller.stopRecording(),
                    child: Container(
                      height: 140.h,
                      width: 140.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF8A5CF6).withOpacity(0.60),
                            offset: const Offset(0, 4),
                            blurRadius: 20,
                          ),
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFA78BFA), Color(0xFF5835C0)],
                        ),
                      ),
                      child: Icon(
                        controller.isRecording.value ? Icons.stop : Icons.mic,
                        color: Colors.white,
                        size: 50.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              controller.isRecording.value ? "Recording..." : "Speak clearly and confidently",
              style: getTextStyle(
                color: AppColors.softBlueNormal,
                fontSize: 12.sp,
              ),
            ),
            10.verticalSpace,


            if (hasRecording) _buildAudioPlayer(),
          ] else ...[
            // --- TYPING MODE UI ---
            _buildTextField(),
          ],

          30.verticalSpace,

          // --- SUBMIT BUTTON LOGIC ---
          if (!isVoice || hasRecording)
            CustomFilledButton(
              text: 'Submit Answer',
              gradient: const LinearGradient(
                begin: Alignment.topCenter,    // 0% - #FFDDC8
                end: Alignment.bottomCenter, // 100% - #FFECC3
                colors: [
                  Color(0xFFFFDDC8),
                  Color(0xFFFFECC3),
                ],
              ),
              textColor: const Color(0xFFF97316),
              onPressed: () {
                AppHelperFunctions.navigateToScreen(context, PracticeSummary());
              },
            ).paddingSymmetric(horizontal: 35.w),

          30.verticalSpace,
        ],
      );
    });
  }

  Widget _buildTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8A5CF6).withOpacity(0.20),
            blurRadius: 12,
          ),
        ],
      ),
      child: TextField(
        maxLines: 5,
        minLines: 3,
        decoration: InputDecoration(
          hintText: "Type your answer here...",
          contentPadding: EdgeInsets.all(16.w),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildAudioPlayer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFE4DBFD)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => controller.playRecording(),
            child: Icon(
              controller.isPlaying.value ? Icons.pause_rounded : Icons.play_arrow_rounded,
              color: const Color(0xFF5835C0),
              size: 28.sp,
            ),
          ),
          Expanded(
            child: Slider(
              value: controller.position.value.inMilliseconds.toDouble(),
              max: controller.duration.value.inMilliseconds.toDouble() > 0
                  ? controller.duration.value.inMilliseconds.toDouble()
                  : 1.0,
              onChanged: (value) => controller.audioPlayer.seek(Duration(milliseconds: value.toInt())),
            ),
          ),
          Text(
            "${_formatDuration(controller.position.value)} / ${_formatDuration(controller.duration.value)}",
            style: getTextStyle(fontSize: 12.sp, color: const Color(0xFF6B6B8A)),
          ),
        ],
      ),
    );
  }
}

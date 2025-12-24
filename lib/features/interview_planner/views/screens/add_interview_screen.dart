import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/common/styles/global_text_style.dart';
import '../../controllers/interview_planner_controller.dart';

class AddInterviewScreen extends StatefulWidget {
  const AddInterviewScreen({super.key});

  @override
  State<AddInterviewScreen> createState() => _AddInterviewScreenState();
}

class _AddInterviewScreenState extends State<AddInterviewScreen> {
  late final controller = Get.find<InterviewPlannerController>();

  @override
  void initState() {
    super.initState();
    controller.clearForm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          'Add Interview',
          style: getTextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF111827),
          ),
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 18.w,
            color: const Color(0xFF111827),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24.h,
            children: [
              // Company Name
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  Text(
                    'Company Name',
                    style: getTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  TextFormField(
                    controller: controller.companyNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter company name',
                      hintStyle: getTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF9CA3AF),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Color(0xFFA78BFA)),
                      ),
                      contentPadding: EdgeInsets.all(12.w),
                    ),
                  ),
                ],
              ),

              // Role/Job Title
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  Text(
                    'Role',
                    style: getTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  TextFormField(
                    controller: controller.roleController,
                    decoration: InputDecoration(
                      hintText: 'Enter job title',
                      hintStyle: getTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF9CA3AF),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Color(0xFFA78BFA)),
                      ),
                      contentPadding: EdgeInsets.all(12.w),
                    ),
                  ),
                ],
              ),

              // Job Description
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  Text(
                    'Paste Job Description',
                    style: getTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  TextFormField(
                    controller: controller.jobDescriptionController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Paste the job description here',
                      hintStyle: getTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF9CA3AF),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Color(0xFFA78BFA)),
                      ),
                      contentPadding: EdgeInsets.all(12.w),
                    ),
                  ),
                ],
              ),

              // Interview Date
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  Text(
                    'Interview Date',
                    style: getTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  Obx(() {
                    return GestureDetector(
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate:
                              controller.selectedDate.value ?? DateTime.now(),
                          firstDate: DateTime(2024),
                          lastDate: DateTime(2026),
                        );
                        if (pickedDate != null) {
                          controller.selectedDate.value = pickedDate;
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.selectedDate.value != null
                                  ? DateFormat(
                                      'MMM dd, yyyy',
                                    ).format(controller.selectedDate.value!)
                                  : 'Select date',
                              style: getTextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: controller.selectedDate.value != null
                                    ? const Color(0xFF111827)
                                    : const Color(0xFF9CA3AF),
                              ),
                            ),
                            Icon(
                              Icons.calendar_today,
                              size: 18.w,
                              color: const Color(0xFF9CA3AF),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),

              // Time
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  Text(
                    'Time',
                    style: getTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  Obx(() {
                    return GestureDetector(
                      onTap: () async {
                        final pickedTime = await showTimePicker(
                          context: context,
                          initialTime:
                              controller.selectedTime.value ?? TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          controller.selectedTime.value = pickedTime;
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.selectedTime.value != null
                                  ? controller.selectedTime.value!.format(
                                      context,
                                    )
                                  : 'Select time',
                              style: getTextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: controller.selectedTime.value != null
                                    ? const Color(0xFF111827)
                                    : const Color(0xFF9CA3AF),
                              ),
                            ),
                            Icon(
                              Icons.access_time,
                              size: 18.w,
                              color: const Color(0xFF9CA3AF),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),

              // Interview Phase Dropdown
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  Text(
                    'Interview Phase',
                    style: getTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  Obx(() {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: DropdownButton<String>(
                        value: controller.selectedPhase.value,
                        items: controller.interviewPhases
                            .map(
                              (phase) => DropdownMenuItem(
                                value: phase,
                                child: Text(phase),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectedPhase.value = value;
                          }
                        },
                        isExpanded: true,
                        underline: const SizedBox(),
                        hint: Text(
                          'Select phase',
                          style: getTextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF9CA3AF),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),

              // Notes
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  Text(
                    'Notes (Optional)',
                    style: getTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  TextFormField(
                    controller: controller.noteController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Add any notes about this interview',
                      hintStyle: getTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF9CA3AF),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Color(0xFFA78BFA)),
                      ),
                      contentPadding: EdgeInsets.all(12.w),
                    ),
                  ),
                ],
              ),

              // Reminders
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12.h,
                children: [
                  Text(
                    'Reminders',
                    style: getTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Remind me 1 day before',
                            style: getTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF111827),
                            ),
                          ),
                        ),
                        Transform.scale(
                          scale: 0.9,
                          alignment: Alignment.centerRight,
                          child: Switch.adaptive(
                            value: controller.oneDayReminderEnabled.value,
                            onChanged: (_) {
                              controller.oneDayReminderEnabled.value =
                                  !controller.oneDayReminderEnabled.value;
                            },
                            activeThumbColor: Colors.white,
                            activeTrackColor: const Color(0xFFA78BFA),
                            inactiveTrackColor: const Color(0xFFF0F0F3),
                            inactiveThumbColor: Colors.white,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ],
                    );
                  }),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Remind me 1 hour before',
                            style: getTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF111827),
                            ),
                          ),
                        ),
                        Transform.scale(
                          scale: 0.9,
                          alignment: Alignment.centerRight,
                          child: Switch.adaptive(
                            value: controller.oneHourReminderEnabled.value,
                            onChanged: (_) {
                              controller.oneHourReminderEnabled.value =
                                  !controller.oneHourReminderEnabled.value;
                            },
                            activeThumbColor: Colors.white,
                            activeTrackColor: const Color(0xFFA78BFA),
                            inactiveTrackColor: const Color(0xFFF0F0F3),
                            inactiveThumbColor: Colors.white,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),

              SizedBox(height: 12.h),

              // Action buttons
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8.w,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        // Add to calendar

                        Get.snackbar('Success', 'Added to calendar');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE4DBFD),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8.w,
                          children: [
                            // Icon(
                            //   Icons.calendar_month,
                            //   size: 18.w,
                            //   color: const Color(0xFF8A5CF6),
                            // ),
                            Flexible(
                              child: Text(
                                'Add to Calendar',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: getTextStyle(
                                  // fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
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
                      onTap: () {
                        // Save interview
                        if (controller.companyNameController.text.isEmpty ||
                            controller.roleController.text.isEmpty ||
                            controller.selectedDate.value == null ||
                            controller.selectedTime.value == null) {
                          Get.snackbar(
                            'Error',
                            'Please fill all required fields',
                          );
                          return;
                        }

                        final newInterview = Interview(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          companyName: controller.companyNameController.text,
                          role: controller.roleController.text,
                          status: 'SCHEDULED',
                          interviewDate: DateTime(
                            controller.selectedDate.value!.year,
                            controller.selectedDate.value!.month,
                            controller.selectedDate.value!.day,
                            controller.selectedTime.value!.hour,
                            controller.selectedTime.value!.minute,
                          ),
                          round: controller.selectedPhase.value ?? '1st Round',
                          reminder:
                              '${controller.oneDayReminderEnabled.value ? '1 day before' : ''} ${controller.oneHourReminderEnabled.value ? '1 hour before' : ''}'
                                  .trim(),
                          preparationProgress: 0.0,
                        );

                        controller.addInterview(newInterview);
                        Get.back();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Interview added for ${newInterview.companyName}',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.00, 0.50),
                            end: Alignment(1.00, 0.50),
                            colors: [Color(0xFFA78BFA), Color(0xFF5734C0)],
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8.w,
                          children: [
                            // Icon(
                            //   Icons.check_circle_outline,
                            //   size: 18.w,
                            //   color: Colors.white,
                            // ),
                            Flexible(
                              child: Text(
                                'Save Interview',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: getTextStyle(
                                  // fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

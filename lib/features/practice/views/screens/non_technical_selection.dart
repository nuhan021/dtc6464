import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/styles/global_text_style.dart';
import '../../../../core/common/widgets/custom_filled_button.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../background/views/widgets/background.dart';
import '../../controller/practice_controller.dart';

class NonTechnicalTopicSelection extends StatelessWidget {
  NonTechnicalTopicSelection({super.key});

  // Get.find ব্যবহার করা হয়েছে কারণ PracticeController অলরেডি মেমোরিতে আছে
  final PracticeController controller = Get.find<PracticeController>();

  final List<String> topics = [
    "Behavioral Interview",
    "Leadership Interview",
    "HR / Culture Fit",
    "Situational Questions",
  ];

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF333333)),
            onPressed: () => Get.back(),
          ),
          title: Text(
              'Select Topic',
              style: getTextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: const Color(0xFF333333))
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                20.verticalSpace,
                // Obx ব্যবহার করা হয়েছে যাতে সিলেকশন চেঞ্জ হলে UI আপডেট হয়
                Obx(() => Column(
                  children: topics.map((topic) => buildTopicCard(topic)).toList(),
                )),
                80.verticalSpace,
                CustomFilledButton(
                    text: "Start Practice",
                    onPressed: () {
                      if (controller.selectedTopic.value.isNotEmpty) {
                        // এখানে আপনার পরবর্তী স্ক্রিনে যাওয়ার লজিক দিন
                        print("Starting practice for: ${controller.selectedTopic.value}");
                      } else {
                        Get.snackbar("Notice", "Please select a topic first");
                      }
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTopicCard(String topic) {
    bool isSelected = controller.selectedTopic.value == topic;

    return GestureDetector(
      onTap: () => controller.selectTopic(topic),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF6F3FF) : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? AppColors.softPurpleNormal : const Color(0xFFE4DBFD),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFA0A0C8).withOpacity(0.08),
              offset: const Offset(0, 8),
              blurRadius: 16,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                topic,
                style: getTextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? AppColors.softPurpleNormal : const Color(0xFF333333),
                ),
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? AppColors.softPurpleNormal : Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
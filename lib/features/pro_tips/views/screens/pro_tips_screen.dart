import 'package:dtc6464/features/pro_tips/controllers/pro_tips_controller.dart';
import 'package:dtc6464/features/pro_tips/widgets/pro_tips_dropdown_item.dart';
import 'package:dtc6464/features/pro_tips/widgets/pro_tips_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProTipsScreen extends StatelessWidget {
  const ProTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProTipsController());

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: Text(
          'Pro Tips',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        automaticallyImplyLeading: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 14.h,
          children: [
            SizedBox(height: 2.h),
            const ProTipsInfoCard(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 14.h,
                children: List.generate(
                  controller.items.length,
                  (index) => ProTipsDropdownItem(
                    item: controller.items[index],
                    index: index,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

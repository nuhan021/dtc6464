import 'package:dtc6464/core/common/styles/global_text_style.dart';
import 'package:dtc6464/core/common/widgets/custom_filled_button.dart';
import 'package:dtc6464/core/utils/constants/colors.dart';
import 'package:dtc6464/core/utils/constants/image_path.dart';
import 'package:dtc6464/features/background/views/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'avatar_selection_screen.dart';

class CollectInfoScreen extends StatelessWidget {
  const CollectInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                40.verticalSpace,
                _HeaderSection(),
                30.verticalSpace,
                _ProgressIndicator(),
                24.verticalSpace,
                _TitleSection(),
                24.verticalSpace,
                _NameFormSection(),
                30.verticalSpace,
                _ActionSection(),
                40.verticalSpace,
              ],
            ).paddingSymmetric(horizontal: 20.w),
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(ImagePath.roboatHead, width: 96.w),
        12.horizontalSpace,
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: AppColors.whiteLight,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.softPurpleLight),
            ),
            child: Text(
              "Let’s begin with some simple details about you!",
              style: getTextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.softPurpleDarker,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: AppColors.softPurpleNormal,
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        8.horizontalSpace,
        Container(
          width: 10.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: AppColors.softPurpleLight,
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
      ],
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'What should I call you?',
          textAlign: TextAlign.center,
          style: getTextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.softPurpleDarker,
          ),
        ),
      ],
    );
  }
}

class _NameFormSection extends StatefulWidget {
  const _NameFormSection();

  @override
  State<_NameFormSection> createState() => _NameFormSectionState();
}

class _NameFormSectionState extends State<_NameFormSection> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.whiteLight,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: AppColors.softPurpleLight),
            ),
            child: TextFormField(
              controller: _controller,
              style: getTextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.softPurpleDarker,
              ),
              decoration: InputDecoration(
                hintText: 'Your Full Name',
                hintStyle: getTextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.softPurpleNormal,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
          ),
          18.verticalSpace,
          Text(
            'We will use this to personalize your experience',
            style: getTextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.softPurpleNormal,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionSection extends StatelessWidget {
  const _ActionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 66.h,
          child: CustomFilledButton(
            text: 'Next',
            onPressed: () => Get.to(() => const AvatarSelectionScreen()),
            isIcon: false,
          ),
        ),
        18.verticalSpace,
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            'Back',
            style: getTextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.softPurpleNormal,
            ),
          ),
        ),
      ],
    );
  }
}

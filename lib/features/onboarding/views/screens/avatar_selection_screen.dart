import 'package:dtc6464/core/common/styles/global_text_style.dart';
import 'package:dtc6464/core/common/widgets/custom_filled_button.dart';
import 'package:dtc6464/core/utils/constants/colors.dart';
import 'package:dtc6464/core/utils/constants/image_path.dart';
import 'package:dtc6464/features/background/views/widgets/background.dart';
import 'package:dtc6464/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AvatarSelectionScreen extends StatefulWidget {
  const AvatarSelectionScreen({super.key});

  @override
  State<AvatarSelectionScreen> createState() => _AvatarSelectionScreenState();
}

class _AvatarSelectionScreenState extends State<AvatarSelectionScreen> {
  final List<String> _avatars = [
    ImagePath.avatar_1,
    ImagePath.avatar_2,
    ImagePath.avatar_3,
    ImagePath.avatar_4,
    ImagePath.avatar_5,
    ImagePath.avatar_6,
    ImagePath.avatar_7,
    ImagePath.avatar_8,
  ];

  int? _selectedIndex;

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
                _Header(),
                28.verticalSpace,
                const _ProgressDots(),
                24.verticalSpace,
                const _Title(),
                18.verticalSpace,
                _AvatarGrid(
                  avatars: _avatars,
                  selectedIndex: _selectedIndex,
                  onSelect: (i) => setState(() => _selectedIndex = i),
                ),
                28.verticalSpace,
                _Footer(
                  onStart: () {
                    if (_selectedIndex == null) {
                      Get.snackbar(
                        'Select avatar',
                        'Please choose an avatar to continue',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }
                    Get.snackbar(
                      'Starting',
                      'Selected avatar: ${_selectedIndex! + 1}',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    Get.offAllNamed(AppRoute.bottomNavBar);
                  },
                ),
                40.verticalSpace,
              ],
            ).paddingSymmetric(horizontal: 20.w),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(ImagePath.roboatHead, width: 92.w),
        14.horizontalSpace,
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.whiteLight,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: AppColors.softPurpleLight),
            ),
            child: Text(
              'Before we begin let me know the basic details about you!',
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

class _ProgressDots extends StatelessWidget {
  const _ProgressDots();

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

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Choose your avatar',
      textAlign: TextAlign.center,
      style: getTextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.softPurpleDarker,
      ),
    );
  }
}

class _AvatarGrid extends StatelessWidget {
  final List<String> avatars;
  final int? selectedIndex;
  final ValueChanged<int> onSelect;

  const _AvatarGrid({
    required this.avatars,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: avatars.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 12.w,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final selected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onSelect(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.whiteLight,
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(
                  color: selected
                      ? AppColors.softPurpleNormal
                      : AppColors.softPurpleLight,
                  width: selected ? 2 : 1,
                ),
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: AppColors.softPurpleNormal.withValues(
                            alpha: 0.12,
                          ),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Image.asset(avatars[index], fit: BoxFit.contain),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onStart;

  const _Footer({required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFilledButton(
          text: 'Start Interview',
          onPressed: onStart,
          isIcon: false,
        ),
      ],
    );
  }
}

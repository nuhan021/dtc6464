import 'package:dtc6464/core/utils/constants/image_path.dart';
import 'package:dtc6464/features/background/views/widgets/background.dart';
import 'package:dtc6464/features/onboarding/controllers/avatar_selection_controller.dart';
import 'package:dtc6464/features/onboarding/widgets/avatar_grid_widget.dart';
import 'package:dtc6464/features/onboarding/widgets/avatar_header_widget.dart';
import 'package:dtc6464/features/onboarding/widgets/avatar_progress_dots.dart';
import 'package:dtc6464/features/onboarding/widgets/start_interview_button.dart';
import 'package:dtc6464/features/onboarding/widgets/title_widget.dart';
import 'package:dtc6464/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AvatarSelectionScreen extends StatelessWidget {
  const AvatarSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AvatarSelectionController());
    final avatars = [
      ImagePath.avatar_1,
      ImagePath.avatar_2,
      ImagePath.avatar_3,
      ImagePath.avatar_4,
      ImagePath.avatar_5,
      ImagePath.avatar_6,
      ImagePath.avatar_7,
      ImagePath.avatar_8,
    ];

    return Scaffold(
      body: Background(
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  60.verticalSpace,
                  43.horizontalSpace,
                  const AvatarHeaderWidget(),
                  56.verticalSpace,
                  const AvatarProgressDots(),
                  24.verticalSpace,
                  const TitleWidget(title: 'Choose your avatar'),
                  20.verticalSpace,
                  AvatarGridWidget(
                    avatars: avatars,
                    selectedIndex: controller.selectedAvatarIndex.value,
                    onSelect: controller.selectAvatar,
                  ),
                  12.verticalSpace,
                  StartInterviewButton(
                    onPressed: () {
                      if (!controller.isAvatarSelected()) {
                        Get.snackbar(
                          'Select avatar',
                          'Please choose an avatar to continue',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        return;
                      }
                      // Route to bottom navigation (clear previous stack)
                      Get.offAllNamed(AppRoute.getBottomNavBar());
                    },
                  ),
                  40.verticalSpace,
                ],
              ).paddingSymmetric(horizontal: 20.w),
            ),
          ),
        ),
      ),
    );
  }
}

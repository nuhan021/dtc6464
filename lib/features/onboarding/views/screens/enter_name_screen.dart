import 'package:dtc6464/features/background/views/widgets/background.dart';
import 'package:dtc6464/features/onboarding/controllers/enter_name_controller.dart';
import 'package:dtc6464/features/onboarding/widgets/enter_name_action_button.dart';
import 'package:dtc6464/features/onboarding/widgets/enter_name_header.dart';
import 'package:dtc6464/features/onboarding/widgets/name_form_widget.dart';
import 'package:dtc6464/features/onboarding/widgets/progress_indicator.dart';
import 'package:dtc6464/features/onboarding/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EnterNameScreen extends StatelessWidget {
  const EnterNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EnterNameController());
    return Scaffold(
      body: Background(
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                60.verticalSpace,
                const EnterNameHeader(),
                56.verticalSpace,
                const OnboardingProgressIndicator(),
                24.verticalSpace,
                const TitleWidget(title: 'What should I call you?'),
                24.verticalSpace,
                NameFormWidget(controller: controller),
                30.verticalSpace,
                const EnterNameActionButton(),
                40.verticalSpace,
              ],
            ).paddingSymmetric(horizontal: 20.w),
          ),
        ),
      ),
    );
  }
}

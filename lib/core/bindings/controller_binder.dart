import 'package:dtc6464/features/collect_info/controller/collect_info_controller.dart';
import 'package:dtc6464/features/onboarding/controller/onboarding_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(),
      // fenix: true,
    );

    Get.lazyPut<CollectInfoController>(
          () => CollectInfoController(),
      // fenix: true,
    );
  }
}

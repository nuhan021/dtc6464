import 'package:dtc6464/core/services/network_caller.dart';
import 'package:dtc6464/features/home/model/today_tips_model.dart';
import 'package:get/get.dart';

import '../../../core/services/storage_service.dart';
import '../../../core/utils/constants/api_constants.dart';
import '../../../core/utils/constants/snackbar_constant.dart';
import '../model/pro_tips_model.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getTodayTips();
    getProTips();
  }

  final NetworkCaller _networkCaller = Get.find<NetworkCaller>();

  RxBool isTodayTipsLoading = false.obs;
  RxBool isTodayTipsError = false.obs;
  RxBool isProTipsLoading = false.obs;
  RxBool isProTipsError = false.obs;

  Rx<TodayTipsModel?> todayTipsData = Rx<TodayTipsModel?>(null);
  Rx<ProTipsModel?> proTipsData = Rx<ProTipsModel?>(null);

  Future<void> getTodayTips() async {
    try {
      isTodayTipsLoading.value = true;
      final token = StorageService.accessToken;
      final response = await _networkCaller.getRequest(
        ApiConstant.baseUrl + ApiConstant.todayTips,
        token: token,
      );

      if (!response.isSuccess) {
        isTodayTipsLoading.value = false;
        isTodayTipsError.value = true;
        SnackBarConstant.error(title: 'Failed', message: response.errorMessage);
        return;
      }

      todayTipsData.value = TodayTipsModel.fromJson(response.responseData);
      isTodayTipsLoading.value = false;
      isTodayTipsError.value = false;
    } catch (e) {
      isTodayTipsLoading.value = false;
      isTodayTipsError.value = true;
      SnackBarConstant.error(title: 'Failed', message: e.toString());
    } finally {
      isTodayTipsLoading.value = false;
    }
  }

  Future<void> getProTips() async {
    try {
      isProTipsLoading.value = true;
      final token = StorageService.accessToken;
      final response = await _networkCaller.getRequest(
        ApiConstant.baseUrl + ApiConstant.proTips,
        token: token,
      );

      if (!response.isSuccess) {
        isProTipsLoading.value = false;
        isProTipsError.value = true;
        SnackBarConstant.error(title: 'Failed', message: response.errorMessage);
        return;
      }

      proTipsData.value = ProTipsModel.fromJson(response.responseData);
      isProTipsLoading.value = false;
      isProTipsError.value = false;
    } catch (e) {
      isProTipsLoading.value = false;
      isProTipsError.value = true;
      SnackBarConstant.error(title: 'Failed', message: e.toString());
    } finally {
      isProTipsLoading.value = false;
    }
  }
}

import 'package:get/get.dart';

import '../../getx_base_classes.dart';

abstract class BaseController<T> extends GetxController {
  var rxIsLoading = false.obs;
  var rxShowError = ''.obs;

  void showLoader() {
    if (!rxIsLoading.value) {
      rxIsLoading(true);
    }
  }

  void hideLoader() {
    if (rxIsLoading.value) {
      rxIsLoading(false);
    }
  }

  void showErrorPopupDialog(String errorMessage) => rxShowError(errorMessage);

  Future<void> callApi(
    Future<BaseResponse<T>> Function() apiCall,
    void Function(T? data) onSuccess,
    void Function(String errorMessage) onFailure, {
    bool showErrorPopup = true,
  }) async {
    try {
      showLoader();
      // await Future.delayed(const Duration(seconds: 3));
      BaseResponse<T> response = await apiCall();
      if (response.success) {
        onSuccess(response.data);
      } else {
        String message = response.message ?? 'No data found';
        if (showErrorPopup) {
          showErrorPopupDialog(message);
        }
        onFailure(message);
      }
    } catch (e) {
      onFailure('An error occurred');
    } finally {
      hideLoader();
    }
  }
}

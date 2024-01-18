import 'package:get/get.dart';

import '../../getx_base_classes.dart';

/// A base controller class providing common functionality for handling asynchronous operations and API calls.
///
/// Extend this class to create custom controllers for different screens or functionalities.
abstract class BaseController<T> extends GetxController {
  /// Observable boolean indicating whether a loading indicator should be displayed.
  var rxIsLoading = false.obs;

  /// Observable string containing an error message to be displayed.
  var rxShowError = ''.obs;

  /// Shows the loading indicator.
  void showLoader() {
    if (!rxIsLoading.value) {
      rxIsLoading(true);
    }
  }

  /// Hides the loading indicator.
  void hideLoader() {
    if (rxIsLoading.value) {
      rxIsLoading(false);
    }
  }

  /// Displays an error popup dialog with the provided [errorMessage].
  void showErrorPopupDialog(String errorMessage) => rxShowError(errorMessage);

  /// Handles API calls, showing loading indicators, handling success and failure scenarios.
  ///
  /// [apiCall]: A function representing the asynchronous API call to be executed.
  /// [onSuccess]: A function to be called on successful API response, passing the data.
  /// [onFailure]: A function to be called on API failure, passing an error message.
  /// [showErrorPopup]: Indicates whether to display an error popup dialog on failure (default is true).
  Future<void> callApi(
    Future<BaseResponse<T>> Function() apiCall,
    void Function(T? data) onSuccess,
    void Function(String errorMessage) onFailure, {
    bool showErrorPopup = true,
  }) async {
    try {
      showLoader();
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

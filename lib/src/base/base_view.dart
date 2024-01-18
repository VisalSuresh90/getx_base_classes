import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

/// An abstract class representing a base view in a GetX architecture with common functionality.
///
/// Extend this class to create custom views for different screens or UI components.
abstract class BaseView<T extends BaseController> extends GetView<T> {
  /// The widget to be shown as a progress indicator. Defaults to [CircularProgressIndicator].
  final Widget? progressDialogWidget;

  /// Constructs a [BaseView] with an optional [progressDialogWidget].
  ///
  /// [progressDialogWidget]: The widget to be shown as a progress indicator.
  const BaseView({Key? key, this.progressDialogWidget}) : super(key: key);

  /// Builds the view with the common structure, including error handling and loading indicators.
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.rxShowError.value.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showErrorPopup(context);
        });
      }
      return Stack(
        children: [
          buildView(),
          if (controller.rxIsLoading.value) // Show loader conditionally
            progressDialogWidget ??
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
        ],
      );
    });
  }

  /// Builds the main view content.
  Widget buildView();

  /// Shows an error popup dialog with the provided error message.
  void _showErrorPopup(BuildContext context) {
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'Error',
      middleText: controller.rxShowError.value,
      confirm: ElevatedButton(
        onPressed: () {
          controller.rxShowError(''); // Hide the error
          Get.back(); // Close the dialog
        },
        child: const Text('OK'),
      ),
    );
  }
}

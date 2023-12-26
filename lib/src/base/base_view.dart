import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

abstract class BaseView<T extends BaseController> extends GetView<T> {
  final Widget? progressDialogWidget;

  const BaseView({Key? key, this.progressDialogWidget}) : super(key: key);

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

  Widget buildView();

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

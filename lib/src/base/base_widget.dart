import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

/// An abstract class representing a base widget in a GetX architecture with common functionality.
///
/// Extend this class to create custom widgets for different UI components.
abstract class BaseWidget<T extends BaseController> extends GetWidget<T> {
  /// An optional tag for the widget, useful for identification or debugging purposes.
  final String? tag;

  /// Constructs a [BaseWidget] with an optional [tag].
  ///
  /// [tag]: An optional tag for the widget.
  const BaseWidget({Key? key, this.tag}) : super(key: key);

  /// Builds the widget's view content.
  ///
  /// [context]: The build context for the widget.
  Widget buildView(BuildContext context);

  /// Builds the widget with the common structure, including reactivity with Obx.
  @override
  Widget build(BuildContext context) => Obx(() => buildView(context));
}

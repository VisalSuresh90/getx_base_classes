import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

abstract class BaseWidget<T extends BaseController> extends GetWidget<T> {
  final String? tag;
  const BaseWidget({Key? key, this.tag}) : super(key: key);

  Widget buildView(BuildContext context);

  @override
  Widget build(BuildContext context) => Obx(() => buildView(context));
}

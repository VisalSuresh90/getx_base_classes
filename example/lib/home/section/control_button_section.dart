import 'package:flutter/material.dart';
import 'package:getx_base_classes/getx_base_classes.dart';

import '../controller/home_controller.dart';

class ControlButtonSection extends BaseWidget<HomeController> {
  const ControlButtonSection({super.key});

  @override
  Widget buildView(BuildContext context) => Container(
        color: Colors.amberAccent,
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Current Multiply Value : ${controller.multiplyValue.value}"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                  onPressed: () => controller.doIncrement(),
                  child: const Text("Add")),
            ),
          ],
        ),
      );
}

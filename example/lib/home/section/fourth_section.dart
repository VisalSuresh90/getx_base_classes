import 'package:example/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_classes/getx_base_classes.dart';

class FourthSection extends BaseWidget<HomeController> {
  const FourthSection({super.key});

  @override
  Widget buildView(BuildContext context) => Card(
        color: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Fourth Section',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Text(
                'Multiply Value : ${controller.multiplyValue.value} x 4 = ${4 * controller.multiplyValue.value}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
}

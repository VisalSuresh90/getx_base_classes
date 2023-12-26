import 'package:example/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_classes/getx_base_classes.dart';

class ThirdSection extends BaseWidget<HomeController> {
  const ThirdSection({super.key});

  @override
  Widget buildView(BuildContext context) => Card(
        color: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Third Section',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Text(
                'Multiply Value :  ${controller.multiplyValue.value} x 3= ${3 * controller.multiplyValue.value}',
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

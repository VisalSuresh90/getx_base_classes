import 'package:example/home/section/control_button_section.dart';
import 'package:example/home/section/fourth_section.dart';
import 'package:example/home/section/second_section.dart';
import 'package:example/home/section/third_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_base_classes/getx_base_classes.dart';

import 'controller/home_controller.dart';
import 'section/first_section.dart';

class HomeScreen extends BaseView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget buildView() => Scaffold(
        appBar: AppBar(
          title: const Text('Getx Base Classes'),
          backgroundColor: Colors.amber,
        ),
        body: widgetView(),
      );

  Widget widgetView() => Responsive(
        mobile: body(children: portratitChildren('Mobile')),
        mobileLandscape: body(children: landscapeChildren('Mobile Landscape')),
        tablet: body(children: portratitChildren('Tablet')),
        tabletLandscape: body(children: landscapeChildren('Tablet Landscape')),
        desktop: body(children: landscapeChildren('Desktop')),
      );

  Container body({required List<Widget> children}) => Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        child: Column(children: children),
      );

  List<Widget> portratitChildren(String screen) => [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(screen,
              style: const TextStyle(color: Colors.black, fontSize: 24)),
        ),
        const Expanded(child: FirstSection()),
        const Expanded(child: SecondSection()),
        const Expanded(child: ThirdSection()),
        const Expanded(child: FourthSection()),
        const Divider(),
        const ControlButtonSection()
      ];

  List<Widget> landscapeChildren(String screen) => [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(screen,
              style: const TextStyle(color: Colors.black, fontSize: 24)),
        ),
        const Expanded(
          child: Row(
            children: [
              Expanded(child: FirstSection()),
              Expanded(child: SecondSection()),
            ],
          ),
        ),
        const Expanded(
          child: Row(
            children: [
              Expanded(child: ThirdSection()),
              Expanded(child: FourthSection()),
            ],
          ),
        ),
        const Divider(),
        const ControlButtonSection()
      ];
}

import 'package:example/home/binding/home_binding.dart';
import 'package:example/home/home_screen.dart';
import 'package:get/get.dart';

const homePageRoute = '/home';
final routes = [
  GetPage(
    name: homePageRoute,
    page: () => const HomeScreen(),
    binding: const HomeBinding(),
  ),
];

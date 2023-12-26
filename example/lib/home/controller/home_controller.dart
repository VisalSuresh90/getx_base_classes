import 'dart:developer';

import 'package:example/model/cart.dart';
import 'package:example/service/home_service.dart';
import 'package:get/get.dart';
import 'package:getx_base_classes/getx_base_classes.dart';

class HomeController extends BaseController {
  var multiplyValue = 1.obs;

  final HomeService homeService = HomeService();
  static const TAG = 'HomeController';

  @override
  void onInit() {
    super.onInit();
    // fetchData();
    fetchCartData();
    // fetchCartFailureData();
  }

  doIncrement() {
    multiplyValue++;
  }

  Future<void> fetchCartData() async {
    callApi(
      () => homeService.fetchCartFailureData(),
      (data) {
        // Handle successful response
        var cart = Cart.fromJson(data!);
        inspect(cart);
        // print('Data received: $data');
      },
      (errorMessage) {
        // Handle failure
        print('Error: $errorMessage');
      },
    );
  }
}

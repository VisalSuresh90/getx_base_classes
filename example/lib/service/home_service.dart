import 'package:getx_base_classes/getx_base_classes.dart';

class HomeService extends BaseConnect {
  Future<BaseResponse<Map<String, dynamic>>> fetchCartData() async {
    try {
      final response = await requestWithResponse<Map<String, dynamic>>(
        '/cart.json',
        fromJsonT: (json) => json,
      );
      return response;
    } catch (e) {
      // Handle error
      print('Error fetching cart data: $e');
      throw Exception('An error occurred while fetching cart data');
    }
  }

  Future<BaseResponse<Map<String, dynamic>>> fetchCartFailureData() async {
    try {
      final response = await requestWithResponse<Map<String, dynamic>>(
        '/cart-failure.json',
        fromJsonT: (json) => json,
      );
      return response;
    } catch (e) {
      // Handle error
      print('Error fetching cart data: $e');
      throw Exception('An error occurred while fetching cart data');
    }
  }
}

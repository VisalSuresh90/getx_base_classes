import 'package:getx_base_classes/getx_base_classes.dart';

import 'cart.dart';

class CartResponse extends BaseResponse<Cart> {
  CartResponse({
    required Cart data,
  }) : super(
          success: true,
          message: '',
          data: data,
        );

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    final Cart cart = Cart.fromJson(json['data']);
    return CartResponse(
      data: cart,
    );
  }
}

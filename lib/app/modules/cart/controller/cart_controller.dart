import 'package:get/get.dart';
import 'package:opencommerce/app/modules/cart/service/cart_service.dart';
import 'package:opencommerce/app/modules/product/product_model.dart';

class CartController extends GetxController{
  Rx<List<Product>> _product = Rx<List<Product>>([]);
  List<Product> get products => _product.value;

  @override
  void onInit() {
    _product.bindStream(CartService().getCartStream());
    super.onInit();
  }
}


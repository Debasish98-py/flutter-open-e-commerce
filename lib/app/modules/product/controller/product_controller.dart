import 'package:get/get.dart';
import 'package:opencommerce/app/modules/product/product_model.dart';
import 'package:opencommerce/app/modules/product/service/product_service.dart';

class ProductsController extends GetxController {
  Rx<List<Product>> _product = Rx<List<Product>>([]);

  List<Product> get products => _product.value;

  @override
  void onInit() {
    _product.bindStream(ProductService().getProductStream());
    super.onInit();
  }
}
import 'package:opencommerce/app/modules/product/product_model.dart';
import 'package:opencommerce/app/modules/product/service/product_service.dart';

// View <===> Controller <===> Service

class ProductController {
  ProductService productService = ProductService();
  List<Product> products = <Product>[];

  // getProducts() async {
  //   products = await productService.getProducts();
  // }
}

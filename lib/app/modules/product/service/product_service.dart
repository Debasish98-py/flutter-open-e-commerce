import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/product/product_model.dart';

class ProductService{
  final firestore = FirebaseFirestore.instance;
  Stream<List<Product>> getProductStream() {
    return firestore
        .collection("Products")
        .snapshots()
        .map((snapShot) => snapShot.docs.map((doc) {
              Product p = Product.fromMap(doc.data());
              p.id = doc.id;
              return p;
            }).toList());
  }
}

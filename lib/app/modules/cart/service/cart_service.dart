import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:opencommerce/app/modules/product/product_model.dart';

class CartService {
  final firestore = FirebaseFirestore.instance;

  Stream<List<Product>> getCartStream() {
    return firestore
        .collection("Cart")
        .snapshots()
        .map((snapShot) => snapShot.docs.map((doc) {
              Product p = Product.fromMap(doc.data());
              var user = FirebaseAuth.instance.currentUser;
              p.id = user.uid;
              return p;
            }).toList());
  }
}

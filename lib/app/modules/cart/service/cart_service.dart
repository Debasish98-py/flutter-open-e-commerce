import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:opencommerce/app/modules/product/product_model.dart';

class CartService {
  final user = FirebaseAuth.instance.currentUser;

  Stream<List<Product>> getCartStream(){
    return FirebaseFirestore.instance
        .collection("Cart")
        .where('id', isEqualTo: user.uid)
        .snapshots()
        .map((snapShot) => snapShot.docs
        .map((doc) => Product.fromMap(doc.data()))
        .toList());
  }
}

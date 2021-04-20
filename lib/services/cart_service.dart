import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opencommerce/models/model.dart';

class CartService {
  final firestore = FirebaseFirestore.instance;

  Stream<List<Product>> getCartStream(){
    return firestore.collection("Cart").snapshots().map((snapShot)=> snapShot.docs.map((doc){
      Product p = Product.fromMap(doc.data());
      p.id = doc.id;
      return p;
    }).toList());
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/product/product_model.dart';

class AddProductController extends GetxController{
  Product product = Product();

  addProduct()async{
      try{
        await FirebaseFirestore.instance
            .collection("Products")
            .doc()
            .set(product.toMap(), SetOptions(merge: true));
      }catch(e){
        Get.snackbar("Error", "Something went wrong!");
      }

  }
}
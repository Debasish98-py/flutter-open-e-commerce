import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/product/product_model.dart';

class AddToCartController extends GetxController{
  // Get the current logged in user data in the user variable.
  var user = FirebaseAuth.instance.currentUser;
  // Put the value of the argument passed from the HomeView to use in the ProductView.
  Product product = Get.arguments;
  // Call this function in the UI to add product to the Cart collection in Firebase.
  addToCart(){
    try{
      // If user exists, set the data to the Cart collection.
      if (user != null) {
        // Collection reference.
        final collection =
        FirebaseFirestore.instance.collection("Cart");
        // Document reference.
        final doc = collection.doc();
        var pr = product;
        // Set product id to user UID for query.
        pr.id = user.uid;
        // Set product unique id to Firebase doc id to uniquely identify a product in the Cart.
        pr.uniId = doc.id;
        // Set the product data to the map.
        collection.doc(pr.uniId).set(pr.toMap());
      }
    }catch(e){
      // Display the message if any error occurs.
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
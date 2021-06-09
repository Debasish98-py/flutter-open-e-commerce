import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/profile/profile_model.dart';

class SetProfileController extends GetxController{
  final _user = FirebaseAuth.instance.currentUser;
  Profile profile = Profile();

  setProfile()async{
    if(_user != null){
      try{
        await FirebaseFirestore.instance
            .collection("UserData")
            .doc(_user.uid)
            .set(profile.toMap());
      }catch(e){
        Get.snackbar("Something", "went wrong!");
      }
    }else{}
  }
}
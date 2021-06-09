import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:opencommerce/app/modules/profile/profile_model.dart';

class ProfileProvider{
  Future<Profile> getProfile() async{

    final _user = FirebaseAuth.instance.currentUser;

    var _doc = await FirebaseFirestore.instance
        .collection("profiles")
        .doc(_user.uid)
        .get();
    if(_doc.exists){
      return Profile.fromMap(_doc.data());
    }else{
      return null;
    }
  }
}
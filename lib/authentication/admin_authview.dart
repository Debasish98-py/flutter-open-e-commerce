import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/authentication/admin_signIn_view.dart';
import 'package:opencommerce/models/model.dart';
import 'package:opencommerce/pages/product-add-edit.dart';

class AdminAuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          var user = snapshot.data;
          if (user == null) {
            return AdminSignInView();
          } else {
            return ProductAddEdit(Product());
          }
        }
      },
    );
  }
}
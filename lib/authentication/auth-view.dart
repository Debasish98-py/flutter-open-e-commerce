import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/pages/home-page.dart';
import 'package:opencommerce/pages/sign-in.dart';

class AuthView extends StatelessWidget {
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
            return SignIn();
          } else {
            return HomeView();
          }
        }
      },
    );
  }
}
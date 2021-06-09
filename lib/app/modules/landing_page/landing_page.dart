import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/app/modules/authentication/sign-in.dart';
import 'package:opencommerce/app/modules/home/home-page.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            //streamBuilder can check the login state live
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, streamSnapshot) {
                  if (streamSnapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text("Error: ${streamSnapshot.error}"),
                      ),
                    );
                  }

                  //connection state active -Do the user login check inside the if statement
                  if (streamSnapshot.connectionState ==
                      ConnectionState.active) {
                    //get user
                    User _user = streamSnapshot.data;

                    //if the user is null we're not logged in
                    if (_user == null) {
                      //user not logged in, head to signin
                      return SignIn();
                    } else {
                      //the user is logged in, head to homepage
                      return HomeView();
                    }
                  }

                  //checking the auth state

                  return Scaffold(
                    body: Center(
                      child: Text(
                        "Checking Authentication",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                });
          }

          return Scaffold(
            body: Center(
              child: Text(
                "Loading...",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          );
        });
  }
}

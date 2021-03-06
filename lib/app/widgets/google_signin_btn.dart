import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opencommerce/app/modules/authentication/auth.dart';

class GoogleSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.00),
      ),
      color: Colors.greenAccent,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              FontAwesomeIcons.google,
              size: 25,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Sign In with Google",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        signInWithGoogle().then((value) => Navigator.pushNamed(context, 'HomeView'),);
      },
    );
  }
}

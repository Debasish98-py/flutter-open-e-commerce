import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opencommerce/widgets/raised-button.dart';

import 'package:opencommerce/widgets/widgets.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(image: 'images/bgImage2.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'ShopLift',
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Button(
                    buttonName: 'Login with Google',
                    icon: FontAwesomeIcons.google,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Button(
                      buttonName: 'Login with Facebook',
                      icon: FontAwesomeIcons.facebook),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  'Create New Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
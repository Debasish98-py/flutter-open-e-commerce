import 'package:flutter/material.dart';
import 'package:opencommerce/widgets/background-image.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(image: 'images/welcomePageBg.jpg'),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/final-logo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontFamily: 'Akaya Kanadaka',
                          fontSize: 40,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(
                        height: 150,
                      ),
                      Column(
                        children: [
                          Center(
                            child: Text(
                              'Have an Account?',
                              style: TextStyle(
                                fontFamily: 'Akaya Kanadaka',
                                fontSize: 25,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: RaisedButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, 'SignIn'),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Need an Account?',
                              style: TextStyle(
                                fontFamily: 'Akaya Kanadaka',
                                fontSize: 25,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: RaisedButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, 'SignIn'),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

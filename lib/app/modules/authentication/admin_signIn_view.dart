import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opencommerce/app/modules/authentication/admin_auth_controller.dart';

class AdminSignInView extends StatefulWidget {
  @override
  _AdminSignInViewState createState() => _AdminSignInViewState();
}

class _AdminSignInViewState extends State<AdminSignInView> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              Container(
                child: Text(
                  "Welcome Admin",
                  style: TextStyle(
                    fontSize: 43,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.40,
              ),
              Card(
                // color: Colors.blue,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: deviceWidth * 0.65,
                      height: deviceHeight * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            FontAwesomeIcons.google,
                            color: Colors.blue,
                          ),
                          Text(
                            "Sign In with Google",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                    adminSignInWithGoogle();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

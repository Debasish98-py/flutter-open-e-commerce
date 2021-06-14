import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/authentication/sign-in.dart';
import 'package:opencommerce/app/modules/authentication/sign-up.dart';
import 'package:opencommerce/app/modules/checkout/checkout_view.dart';
import 'package:opencommerce/app/modules/landing_page/landing_page.dart';
import 'package:opencommerce/app/modules/product/views/home_page.dart';
import 'package:opencommerce/app/modules/profile/views/profile_add_edit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool initialized = false;

  @override
  void initState() {
    initApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter e-commerce',
      home: initialized
          ? LandingPage()
          : Center(
              child: CircularProgressIndicator(),
            ),
      debugShowCheckedModeBanner: false,
      routes: {
        'SignIn': (context) => SignIn(),
        // 'HomeView': (context) => HomeView(),
        'SignUp': (context) => SignUp(),
        'ProfileAddEditView': (context) => ProfileAddEditView(),
        'CheckoutView': (context) => CheckoutView(),

        // 'ProductAddEdit': (context) => ProductAddEdit(),
      },
    );
  }

  void initApp() async {
    await Firebase.initializeApp();
    setState(() {
      initialized = true;
    });
  }
}

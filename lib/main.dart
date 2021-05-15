import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opencommerce/models/profile_model.dart';

import 'package:opencommerce/pages/home-page.dart';
import 'package:opencommerce/pages/profile_add_edit.dart';
import 'package:opencommerce/pages/video_player.dart';
import 'pages/pages.dart';

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
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: 'Landing Page',
      routes: {
        'SignIn': (context) => SignIn(),
        'HomeView': (context) => HomeView(),
        'SignUp': (context) => SignUp(),
        'VideoPlayer': (context) => VideoPlayer(),
        'ProfileAddEditView': (context) => ProfileAddEditView(
              profile: Profile(),
            ),
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

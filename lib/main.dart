import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter e-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'IphoneSE',
      routes: {
        'WelcomePage': (context) => WelcomePage(),
        'SignIn': (context) => SignIn(),
        'HomePage': (context) => HomePage(),
        'IphoneSE': (context) => IphoneSE(),
      },
    );
  }
}

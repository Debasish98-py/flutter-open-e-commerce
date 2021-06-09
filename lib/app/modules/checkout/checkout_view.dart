import 'package:flutter/material.dart';

class CheckoutView extends StatefulWidget {
  @override
  _CheckoutViewState createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckOut"),
      ),
      body: Container(
        padding: EdgeInsets.all(14),
        color: Colors.grey,
        child: Column(
          children: [Text("abc")],
        ),
      ),
    );
  }
}

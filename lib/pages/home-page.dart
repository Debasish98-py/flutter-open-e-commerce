import 'package:flutter/material.dart';

final List<String> products = ["iPhone SE", "iPhone XR", "iPhone XS"];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Safe Buy'),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                var product = products[index];
                return ListTile(
                  leading: Image.asset("images/bgImage.jpg"),
                  title: Text(product),
                  subtitle: Text("Tiny iPhone"),
                );
              }),
        ),
      ),
    );
  }
}

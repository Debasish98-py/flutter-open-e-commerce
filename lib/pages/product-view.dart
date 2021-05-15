import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/models/model.dart';
import 'package:opencommerce/pages/pages.dart';
import 'package:opencommerce/pages/product-add-edit.dart';

class ProductView extends StatefulWidget {
  final Product product;

  ProductView(this.product);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("${widget.product.name}"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductAddEdit(widget.product)),
              );
              setState(() {});
            },
          ),
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CartView()),
                );
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 300,
                child: Image.network(
                  widget.product.imageUrl,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              widget.product.name,
              style: TextStyle(
                fontSize: 22,
                fontFamily: "Akaya Kanadaka",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "₹${widget.product.price}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "₹${widget.product.discount} off",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            GestureDetector(
              child: Container(
                height: 50,
                width: deviceWidth * 0.50,
                color: Colors.lightBlueAccent,
                child: Center(
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () async {
                var user = FirebaseAuth.instance.currentUser;

                if (user != null) {
                  final collection =
                      FirebaseFirestore.instance.collection("Cart");
                  final doc = collection.doc();
                  var pr = widget.product;
                  pr.id = user.uid;
                  pr.uniId = doc.id;
                  collection.doc(pr.uniId).set(pr.toMap());
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${widget.product.name} added to your cart"),
                  ),
                );
              },
            ),
            GestureDetector(
              child: Container(
                height: 50,
                width: deviceWidth * 0.50,
                color: Colors.orange,
                child: Center(
                  child: Text(
                    "BUY NOW",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: (){
                Get.to(CheckoutView());
              },
            ),
          ],
        ),
      ),
    );
  }
}

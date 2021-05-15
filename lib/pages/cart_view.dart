import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:opencommerce/models/model.dart';
import 'package:opencommerce/pages/product-view.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("My Cart"),
      ),
      body: Container(
        child: StreamBuilder<List<Product>>(
          stream: FirebaseFirestore.instance
              .collection("Cart")
              .where('id', isEqualTo: user.uid)
              .snapshots()
              .map((snapShot) => snapShot.docs
                  .map((doc) => Product.fromMap(doc.data()))
                  .toList()),
          builder: (context, snapShot) {
            if (snapShot.hasError)
              return Text("Error!!, ${snapShot.error.toString()}");
            else if (snapShot.hasData &&
                snapShot.connectionState != ConnectionState.waiting) {
              final List<Product> products = snapShot.data;
              // var product= Product();
              return ListView(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      Product product = products[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        margin: EdgeInsets.all(5),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductView(product)));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.shortName ?? '',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Akaya Kanadaka",
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "₹${product.price}",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: "Akaya Kanadaka",
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "-₹${product.discount}",
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 18,
                                                  fontFamily: "Akaya Kanadaka",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 100,
                                      width: 120,
                                      child: Image.network(
                                        product.imageUrl,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 50,
                                    width: deviceWidth * 0.45,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.save_alt_outlined,
                                          size: 15,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "ADD TO WISHLIST",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: "Akaya Kanadaka"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      height: 50,
                                      width: deviceWidth * 0.45,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.delete,
                                            size: 15,
                                            color: Colors.red,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "REMOVE",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: "Akaya Kanadaka"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            titlePadding: EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              top: 15,
                                              bottom: 8,
                                            ),
                                            contentPadding: EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              top: 8,
                                              bottom: 1,
                                            ),
                                            buttonPadding: EdgeInsets.all(1),
                                            actionsPadding: EdgeInsets.all(1),
                                            title: Text(
                                              "Delete product",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontFamily: "Akaya Kanadaka"),
                                            ),
                                            content: Text(
                                              "Are you sure you want to remove the item?",
                                              style: TextStyle(
                                                fontFamily: "Akaya Kanadaka",
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                child: Text(
                                                  "Yes",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "Akaya Kanadaka",
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  FirebaseFirestore.instance
                                                      .collection('Cart')
                                                      .doc(product.uniId)
                                                      .delete();
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              TextButton(
                                                child: Text(
                                                  "No",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "Akaya Kanadaka",
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                        barrierDismissible: false,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: snapShot.data.isNotEmpty,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      margin: EdgeInsets.all(5),
                      shadowColor: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ///kakku
                                Text(
                                  "PRICE DETAILS",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Akaya Kanadaka",
                                  ),
                                ),
                              ],
                            ),
                            Divider(thickness: 2, color: Colors.black),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Akaya Kanadaka",
                                      ),
                                    ),
                                    Text(
                                      "₹${calculateTotal(products)}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Akaya Kanadaka",
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Discount",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Akaya Kanadaka",
                                      ),
                                    ),
                                    Text(
                                      "-₹${discount(products)}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.green,
                                        fontFamily: "Akaya Kanadaka",
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Delivery Charge",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Akaya Kanadaka",
                                      ),
                                    ),
                                    Text(
                                      "₹${0}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Akaya Kanadaka",
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Divider(thickness: 1, color: Colors.black),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Amount",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: "Akaya Kanadaka",
                                  ),
                                ),
                                Text(
                                  "₹${totalAmount(products)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: "Akaya Kanadaka",
                                  ),
                                )
                              ],
                            ),
                            Divider(thickness: 2, color: Colors.black),
                            Row(
                              children: [
                                Text(
                                  "You saved a total of ₹${discount(products)}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    fontFamily: "Akaya Kanadaka",
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: 60,
              color: Colors.yellow,
              child: Center(
                child: Text(
                  "Proceed to Checkout",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Akaya Kanadaka",
                  ),
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, 'CheckoutView');
          },
        ),
      ),
    );
  }

  /// kakkuValaniTumi
  /// kakiKemonAchen

  double calculateTotal(List<Product> products) {
    var totalPrice = 0.0;

    for (Product product in products) {
      totalPrice += product.price;
    }
    return totalPrice;
  }

  double discount(List<Product> products) {
    var discount = 0.0;
    for (Product product in products) {
      discount += product.discount;
    }
    return discount;
  }

  double totalAmount(List<Product> products) {
    var totalAmount = 0.0;
    // ignore: unused_local_variable
    for (Product product in products) {
      totalAmount = calculateTotal(products) - discount(products);
    }
    return totalAmount;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/cart/controller/cart_controller.dart';
import 'package:opencommerce/app/modules/checkout/checkout_view.dart';
import 'package:opencommerce/app/modules/product/product_model.dart';
import 'package:opencommerce/app/modules/product/views/product_view.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return GetX<CartController>(
      init: CartController(),
      builder: (_controller) {
        if (_controller.products.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: Text("My Cart"),
              backgroundColor: Colors.orange,
            ),
            body: SafeArea(
              child: Center(
                child: Container(
                  child: Text("Add products to your cart"),
                ),
              ),
            ),
          );
        } else if (_controller.products.isNotEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: Text("My Cart"),
              backgroundColor: Colors.orange,
            ),
            body: SafeArea(
              child: Container(
                child: ListView(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _controller.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        Product product = _controller.products[index];
                        return Card(
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
                                          Get.to(() => ProductView());
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
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Seller:',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Rating:',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(height: 12),
                                            Row(
                                              children: [
                                                Text(
                                                  "₹${product.price}",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  "-₹${product.discount}",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 12),
                                            Text(
                                              'Delivery by:',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
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
                                          SizedBox(width: 5),
                                          Text(
                                            "ADD TO WISHLIST",
                                            style: TextStyle(
                                              color: Colors.blue,
                                            ),
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
                                            SizedBox(width: 5),
                                            Text(
                                              "REMOVE",
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
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
                                                style: TextStyle(fontSize: 22),
                                              ),
                                              content: Text(
                                                "Are you sure you want to remove the item?",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              actions: [
                                                TextButton(
                                                  child: Text(
                                                    "Yes",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    FirebaseFirestore.instance
                                                        .collection('Cart')
                                                        .doc(product.uniId)
                                                        .delete();
                                                    Get.back();
                                                    // Navigator.pop(context);
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text(
                                                    "No",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Get.back();
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
                    Visibility(
                      visible: _controller.products.isNotEmpty,
                      child: Card(
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
                                  Text(
                                    "PRICE DETAILS",
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Price"),
                                      Text(
                                          "₹${calculateTotal(_controller.products)}")
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Discount"),
                                      Text(
                                        "-₹${discount(_controller.products)}",
                                        style: TextStyle(
                                          color: Colors.green,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Delivery Charge"),
                                      Text("₹${0}")
                                    ],
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Amount"),
                                  Text("₹${totalAmount(_controller.products)}")
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text(
                                    "You saved a total of ₹${discount(_controller.products)}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
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
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              child: GestureDetector(
                child: Container(
                  height: 60,
                  color: Colors.orange,
                  child: Center(
                    child: Text(
                      "Proceed to Checkout",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Get.to(() => CheckoutView(),
                      arguments: totalAmount(_controller.products));
                },
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/model.dart';
import 'package:opencommerce/pages/product-view.dart';
import 'package:opencommerce/services/cart_service.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
        ),
        body: Container(
          ///kakku
          child: StreamBuilder<List<Product>>(
            stream: CartService().getCartStream(),
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
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          margin: EdgeInsets.all(5),
                          color: Colors.white38,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ///kakku
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
                                          children: [
                                            Text(
                                              product.name ?? '',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                                    ),
                                            Text(
                                              "₹${product.price}",
                                              style: TextStyle(fontSize: 20),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              "-₹${product.discount}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Image.network(
                                        product.imageUrl,
                                        fit: BoxFit.fitWidth,
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
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Add to WishList"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                child: Wrap(
                                                  children: [
                                                    ListTile(
                                                        leading:
                                                            Icon(Icons.delete),
                                                        title: Text("Delete"),
                                                        onTap: () {
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'Cart')
                                                              .doc(product.id)
                                                              .delete();
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      child: Text("Remove"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        ),
                      ),
                      margin: EdgeInsets.all(5),
                      color: Colors.brown,
                      shadowColor: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(20),
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
                                      fontWeight: FontWeight.bold),
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
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      "₹${calculateTotal(products)}",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Discount",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      "-₹${discount(products)}",
                                      style: TextStyle(fontSize: 20,color: Colors.green),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Delivery Charge",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      "₹${0}",
                                      style: TextStyle(fontSize: 20),
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
                                      fontSize: 20),
                                ),
                                Text(
                                  "₹${totalAmount(products)}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
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
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Card(
                    //   child: Container(
                    //     child: Text("${_calculateTotal(products)}"),
                    //   ),
                    // ),
                  ],
                );
              } else {
                return Center(
                  child: Text(
                    "Cart Loading...",
                    style: TextStyle(fontSize: 22),
                  ),
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

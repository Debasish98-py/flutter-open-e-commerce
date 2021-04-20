import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/model.dart';
import 'package:opencommerce/pages/product-view.dart';
import 'package:opencommerce/services/cart_service.dart';

class CartView extends StatefulWidget {
  // final List<Product> products;
  //
  // CartView(this.products);

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
          child: StreamBuilder<List<Product>>(
              stream: CartService().getCartStream(),
              builder: (context, snapShot) {
                if (snapShot.hasError)
                  return Text("Error!!, ${snapShot.error.toString()}");
                else if (snapShot.hasData &&
                    snapShot.connectionState != ConnectionState.waiting) {
                  final List<Product> products = snapShot.data;
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      Product product = products[index];
                      return Card(
                        margin: EdgeInsets.all(20),
                        color: Colors.red,
                        child: Padding(
                          padding: EdgeInsets.all(20),
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
                                          )
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
                                                        FirebaseFirestore.instance.collection('Cart').doc(product.id).delete();
                                                          Navigator.pop(context);
                                                      }

                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      child: Text("Remove")),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                      child: Text(
                    "Cart Loading...",
                    style: TextStyle(fontSize: 22),
                  ));
                }
              }),
        ),
      ),
    );
  }
}

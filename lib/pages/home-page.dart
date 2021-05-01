import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:opencommerce/controllers/product_controller.dart';
import 'package:opencommerce/models/model.dart';
import 'package:opencommerce/models/profile_model.dart';
import 'package:opencommerce/pages/ProfileView.dart';
import 'package:opencommerce/pages/pages.dart';
import 'package:opencommerce/pages/product-view.dart';
import 'package:opencommerce/pages/profile_add_edit.dart';
import 'package:opencommerce/product-add-edit.dart';
import 'package:opencommerce/services/product_service.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ProductController productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Free Commerce",
            style: TextStyle(fontFamily: "Akaya Kanadaka", fontSize: 25),
          ),
          actions: [
            // IconButton(
            //     icon: Icon(Icons.logout),
            //     onPressed: () {
            //       FirebaseAuth.instance.signOut();
            //     }),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProductAddEdit(
                      Product(),
                    ),
                  ),
                );
              },
            ),
            // IconButton(
            //     icon: Icon(Icons.person_add),
            //     onPressed: () {
            //       Navigator.pushNamed(context, 'ProfileAddEditView');
            //     }),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CartView(),
                  ),
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                color: Colors.grey,
                child: SizedBox(
                  height: 150.0,
                  child: Icon(
                    Icons.person,
                    size: 60.0,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Profile",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () async {
                  Profile _profile;

                  /// fetch profile from firebase if exist
                  final user = FirebaseAuth.instance.currentUser;
                  DocumentSnapshot doc = await FirebaseFirestore.instance
                      .collection("profiles")
                      .doc(user.uid)
                      .get();
                  if (doc.exists) {
                    _profile = Profile.fromMap(
                      doc.data(),
                    );
                  }

                  if (_profile != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileView(_profile)));
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileAddEditView(
                          profile: Profile(),
                        ),
                      ),
                    );
                  }
                },
              ),
              ListTile(
                title: Text(
                  "Sign Out",
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Flexible(
                child: Container(
                  height: 170,
                  // padding: EdgeInsets.all(10),
                  child: StreamBuilder<List<Product>>(
                    stream: ProductService().getProductStream(),
                    builder: (context, snapShot) {
                      if (snapShot.hasError)
                        return Text("Error!!, ${snapShot.error.toString()}");
                      else if (snapShot.hasData &&
                          snapShot.connectionState != ConnectionState.waiting) {
                        final List<Product> products = snapShot.data;
                        return Column(
                          children: [
                            Container(
                              height: 150,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: products.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        Product product = products[index];
                                        return Row(
                                          children: [
                                            GestureDetector(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                      Colors.blue[900],
                                                      Colors.purple[700]
                                                    ],
                                                  )),
                                                  padding: EdgeInsets.all(7),
                                                  height: 150,
                                                  width: 120,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Flexible(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Container(
                                                            height: 90,
                                                            width: 90,
                                                            child: Image.network(
                                                              product.imageUrl,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        product.name,
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontFamily:
                                                                "Akaya Kanadaka"),
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                      Text(
                                                        product.price
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        ProductView(product),
                                                  ),
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //   child: ListView(
                            //     children: [
                            //       ListView.builder(
                            //
                            //       ),
                            //     ],
                            //   ),
                            // ),
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
              ),
              Container(
                // padding: EdgeInsets.all(14),
                child: Card(
                  color: Colors.deepOrangeAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Things you might like",
                        style: TextStyle(
                            fontSize: 25, fontFamily: "Akaya Kanadaka"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: Container(
                  // padding: EdgeInsets.all(10),
                  child: StreamBuilder<List<Product>>(
                    stream: FirebaseFirestore.instance
                        .collection("Products")
                        .where("manufacturer", isEqualTo: "Xiaomi")
                        .snapshots()
                        .map((snapShot) => snapShot.docs
                            .map((doc) => Product.fromMap(doc.data()))
                            .toList()),
                    builder: (context, snapShot) {
                      if (snapShot.hasData &&
                          snapShot.connectionState != ConnectionState.waiting) {
                        final List<Product> _products = snapShot.data;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: _products.length,
                          itemBuilder: (context, index) {
                            var product = _products[index];
                            return Card(
                              elevation: 5,
                              color: Colors.white54,
                              child: ListTile(
                                title: Text(
                                  product.name,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: "Akaya Kanadaka"),
                                ),
                                subtitle: Text(
                                  "₹${product.price}",
                                  style: TextStyle(fontSize: 18),
                                ),
                                trailing: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    child: Image.network(
                                      product.imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.red),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

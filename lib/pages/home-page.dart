import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/controllers/product_controller.dart';
import 'package:opencommerce/main.dart';
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
          title: Text("Free Commerce"),
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
                          builder: (BuildContext context) =>
                              ProductAddEdit(Product())));
                }),
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
                        builder: (BuildContext context) =>
                            CartView(cart.products)),
                  );
                }),
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
                title: Text("Profile", style: TextStyle(fontSize: 20),),
                onTap: () async {
                  Profile _profile;

                  /// fetch profile from firebase if exist
                  final user = FirebaseAuth.instance.currentUser;
                  DocumentSnapshot doc = await FirebaseFirestore.instance
                      .collection("profiles")
                      .doc(user.uid)
                      .get();
                  if (doc.exists) {
                    _profile = Profile.fromMap(doc.data());
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
                            builder: (context) => ProfileAddEditView()));
                  }
                },

              ),
              ListTile(
                title: Text("Sign Out",style: TextStyle(fontSize: 15),),
                onTap: (){
                  FirebaseAuth.instance.signOut();
                },
              )
            ],
          ),
        ),
        body: Container(
            child: StreamBuilder<List<Product>>(
                stream: ProductService().getProductStream(),
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
                        return ListTile(
                          leading: Image.network(product.imageUrl),
                          title: Text(product.name),
                          subtitle: Text("₹${product.price}"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ProductView(product)));
                          },
                        );
                      },
                    );
                  } else {
                    return Center(
                        child: Text(
                      "Opekkha koro, data aitase",
                      style: TextStyle(fontSize: 22),
                    ));
                  }
                })),
      ),
    );
  }
}

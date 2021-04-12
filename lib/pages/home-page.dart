import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/controllers/product_controller.dart';
import 'package:opencommerce/main.dart';
import 'package:opencommerce/models/model.dart';
import 'package:opencommerce/pages/pages.dart';
import 'package:opencommerce/pages/product-view.dart';
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
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                }),
            IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ProductAddEdit(Product())));
                }),
            IconButton(
                icon: Icon(Icons.person_add),
                onPressed: () {
                  Navigator.pushNamed(context, 'ProfileUpdate');
                }),
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => CartView(cart.products)),
                  );
                }),
          ],
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
                          subtitle: Text("${product.price}"),
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/home/home-page.dart';

import 'package:opencommerce/app/modules/product/product_model.dart';

class ProductAddEdit extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Product product;

  ProductAddEdit(this.product);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product Add/Edit"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                var form = _formKey.currentState;
                if (form.validate()) {
                  /// data is valid. lets save the form.
                  form.save();

                  product.inStock = true;

                  /// form data is now valid. you may save to db.
                  if (product.id != null) {
                    FirebaseFirestore.instance
                        .collection("Products")
                        .doc(product.id)
                        .set(product.toMap(), SetOptions(merge: true));
                  } else {
                    FirebaseFirestore.instance
                        .collection("Products")
                        .doc()
                        .set(product.toMap(), SetOptions(merge: true));
                  }

                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // this.name,
                TextFormField(
                  initialValue: product.name,
                  decoration: InputDecoration(
                    labelText: "Product Name",
                  ),
                  validator: (value) => _validate(value, "Product Name"),
                  onSaved: (value) {
                    product.name = value;
                  },
                ),
                TextFormField(
                  initialValue: product.shortName,
                  decoration: InputDecoration(
                    labelText: "Short Name",
                  ),
                  validator: (value) => _validate(value, "Short Name"),
                  onSaved: (value) {
                    product.shortName = value;
                  },
                ),
                // this.price,
                TextFormField(
                  keyboardType: TextInputType.number,
                  initialValue:
                      product.price != null ? product.price.toString() : '',
                  validator: (value) => _validate(value, "Price"),
                  decoration: InputDecoration(
                    labelText: "Product price",
                  ),
                  onSaved: (value) {
                    product.price = double.parse(value);
                  },
                ), // this.imageUrl,
                TextFormField(
                  initialValue: product.imageUrl,
                  validator: (value) => _validate(value, "Image Url"),
                  decoration: InputDecoration(
                    labelText: "Product Image Url",
                  ),
                  onSaved: (value) => product.imageUrl = value,
                ), // this.description,
                TextFormField(
                  initialValue: product.description,
                  validator: (value) => _validate(value, "Description"),
                  decoration: InputDecoration(
                    labelText: "Product description",
                  ),
                  minLines: 2,
                  maxLines: 4,
                  onSaved: (value) => product.description = value,
                ),

                // this.manufacturer,
                TextFormField(
                  initialValue: product.discount != null
                      ? product.discount.toString()
                      : '',
                  validator: (value) => _validate(value, "Discount"),
                  decoration: InputDecoration(
                    labelText: "Discount",
                  ),
                  onSaved: (value) {
                    product.discount = double.parse(value);
                  },
                ),
                TextFormField(
                  initialValue: product.manufacturer,
                  validator: (value) => _validate(value, "Manufacturer"),
                  decoration: InputDecoration(
                    labelText: "Product manufacturer",
                  ),
                  onSaved: (value) => product.manufacturer = value,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 40,
                        width: 200,
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            "Remove Product",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            child: Wrap(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.delete),
                                  title: Text("Delete"),
                                  onTap: () {
                                    FirebaseFirestore.instance
                                        .collection('Products')
                                        .doc(product.id)
                                        .delete();
                                    Get.off(() => HomeView());
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                // this.inStock,
              ],
            ),
          ),
        ),
      ),
    );
  }

  _validate(value, fieldName) {
    if (value.isEmpty) {
      return "$fieldName is required.";
    } else
      return null;
  }
}

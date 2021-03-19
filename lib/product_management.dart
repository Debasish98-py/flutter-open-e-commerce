import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:opencommerce/widgets/widgets.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController _nameController,
      _priceController,
      _imageUrlController,
      _descriptionController,
      _manufacturerController,
      _inStockController;
  /*FirebaseFirestore _ref;*/

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _imageUrlController = TextEditingController();
    _descriptionController = TextEditingController();
    _manufacturerController = TextEditingController();
    _inStockController = TextEditingController();
    /*_ref =
        FirebaseFirestore.instance.collection('Products') as FirebaseFirestore;*/
  }

  Widget build(BuildContext context) {
    CollectionReference products = FirebaseFirestore.instance.collection('Products');
    return Stack(
      children: [
        BackgroundImage(image: 'images/PM_bg.jpg'),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text('Product Management'),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'Add product to firebase',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      TextIPField(
                        controller: _nameController,
                        hint: 'Product Name',
                        icon: FontAwesomeIcons.idCard,
                      ),
                      TextIPField(
                        controller: _priceController,
                        hint: 'Price',
                        icon: FontAwesomeIcons.moneyBill,
                      ),
                      TextIPField(
                        controller: _imageUrlController,
                        hint: 'Image URL',
                        icon: FontAwesomeIcons.image,
                      ),
                      TextIPField(
                        controller: _descriptionController,
                        hint: 'Product Description',
                        icon: FontAwesomeIcons.info,
                      ),
                      TextIPField(
                        controller: _manufacturerController,
                        hint: 'Manufacturer',
                        icon: FontAwesomeIcons.industry,
                      ),
                      TextIPField(
                        controller: _inStockController,
                        hint: 'In Stock',
                        icon: FontAwesomeIcons.dropbox,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomBtn(
                        text: 'Update',
                        onPressed: () {
                          uploadDetails();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void uploadDetails() {
    String name = _nameController.text;
    String price = _priceController.text;
    String imageUrl = _imageUrlController.text;
    String description = _descriptionController.text;
    String manufacturer = _manufacturerController.text;
    String inStock = _inStockController.text;

    Map<String, String> product = {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
      'manufacturer': manufacturer,
      'inStock': inStock,
    };
    FirebaseFirestore.instance.collection("Products").add(product);

  }
}

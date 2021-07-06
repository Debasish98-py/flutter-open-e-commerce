import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/product/controller/products_add_controller.dart';

class ProductAddEdit extends StatefulWidget {
  @override
  _ProductAddEditState createState() => _ProductAddEditState();
}
class _ProductAddEditState extends State<ProductAddEdit> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AddProductController>(
        init: AddProductController(),
        builder: (_controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Product Add/Edit"),
              actions: [
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () async{
                    var form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      _controller.product.inStock = true;
                      await _controller.addProduct();
                      Get.snackbar("Success", "Product Added");
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
                    TextFormField(
                      initialValue: "",
                      decoration: InputDecoration(
                        labelText: "Product Name",
                      ),
                      validator: (value) => _validate(value, "Product Name"),
                      onSaved: (value) {
                        _controller.product.name = value;
                      },
                    ),
                    TextFormField(
                      initialValue: "",
                      decoration: InputDecoration(
                        labelText: "Short Name",
                      ),
                      validator: (value) => _validate(value, "Short Name"),
                      onSaved: (value) {
                        _controller.product.shortName = value;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: "",
                      validator: (value) => _validate(value, "Price"),
                      decoration: InputDecoration(
                        labelText: "Product price",
                      ),
                      onSaved: (value) {
                        _controller.product.price = double.parse(value);
                      },
                    ),
                    TextFormField(
                      initialValue: "",
                      validator: (value) => _validate(value, "Image Url"),
                      decoration: InputDecoration(
                        labelText: "Product Image Url",
                      ),
                      onSaved: (value) => _controller.product.imageUrl = value,
                    ),
                    TextFormField(
                      initialValue: "",
                      validator: (value) => _validate(value, "Description"),
                      decoration: InputDecoration(
                        labelText: "Product description",
                      ),
                      minLines: 2,
                      maxLines: 4,
                      onSaved: (value) => _controller.product.description = value,
                    ),
                    TextFormField(
                      initialValue: "",
                      validator: (value) => _validate(value, "Discount"),
                      decoration: InputDecoration(
                        labelText: "Discount",
                      ),
                      onSaved: (value) {
                        _controller.product.discount = double.parse(value);
                      },
                    ),
                    TextFormField(
                      initialValue: "",
                      validator: (value) => _validate(value, "Manufacturer"),
                      decoration: InputDecoration(
                        labelText: "Product manufacturer",
                      ),
                      onSaved: (value) => _controller.product.manufacturer = value,
                    ),
                    TextFormField(
                      initialValue: "",
                      decoration: InputDecoration(
                        labelText: "Tags(separate tags using a comma)",
                      ),
                      onSaved: (value) {
                        var val = value.split(',');
                        _controller.product.keywords = val;
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
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

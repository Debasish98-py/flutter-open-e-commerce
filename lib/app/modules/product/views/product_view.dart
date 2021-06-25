import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/cart/controller/add_to_cart_controller.dart';
import 'package:opencommerce/app/modules/cart/view/cart_view.dart';
import 'package:opencommerce/app/modules/checkout/checkout_view.dart';

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return GetBuilder<AddToCartController>(
      init: AddToCartController(),
      builder: (_controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text("${_controller.product.name}"),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Get.to(
                    () => CartView(),
                  );
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 300,
                      child: Image.network(
                        _controller.product.imageUrl,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    _controller.product.name,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "₹${_controller.product.price}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "₹${_controller.product.discount} off",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Product description:",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                  Divider(),
                  Text(
                    _controller.product.description,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              children: [
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: deviceWidth * 0.50,
                    color: Colors.lightBlueAccent,
                    child: Center(
                      child: Text(
                        "ADD TO CART",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    await _controller.addToCart();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "${_controller.product.shortName} added to your cart"),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: deviceWidth * 0.50,
                    color: Colors.orange,
                    child: Center(
                      child: Text(
                        "BUY NOW",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => CheckoutView());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

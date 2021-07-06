import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/cart/view/cart_view.dart';
import 'package:opencommerce/app/modules/product/controller/product_controller.dart';
import 'package:opencommerce/app/modules/product/product_model.dart';
import 'package:opencommerce/app/modules/product/views/product_view.dart';
import 'package:opencommerce/app/widgets/custom_appDrawer/appDrawer.dart';
import 'package:opencommerce/app/widgets/search_bar/view/search_bar.dart';

class HomePage extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    var height = Get.context.height;
    var width = Get.context.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: false,
        title: Text(
          "E-Mart",
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(() => CartView());
            },
          ),
        ],
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: SearchBar(),
          ),
          preferredSize: Size.fromHeight(60),
        ),
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: GetX<ProductsController>(
          init: ProductsController(),
          builder: (_controller) {
            if (_controller != null && _controller.products != null) {
              return ListView.builder(
                itemCount: _controller.products.length,
                itemBuilder: (context, index) {
                  Product product = _controller.products[index];
                  return Column(
                    children: [
                      GestureDetector(
                        child: Slidable(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: height * 0.13,
                                      width: width * 0.2,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(product.imageUrl),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.shortName,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Text(
                                          "₹${product.price}",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Text(
                                          "-₹${product.discount}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.green),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  product.description,
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          actionPane: SlidableDrawerActionPane(),
                          secondaryActions: [
                            IconSlideAction(
                              icon: FontAwesomeIcons.shoppingCart,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                        onTap: () {
                          Get.to(() => ProductView(), arguments: product);
                        },
                      ),
                      Divider(),
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

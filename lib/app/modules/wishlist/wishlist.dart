import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyWishlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = Get.context.height;
    var width = Get.context.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "My Orders",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "My Wishlist",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: width * 0.01),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: height * 0.03,
                    width: width * 0.15,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/beta.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

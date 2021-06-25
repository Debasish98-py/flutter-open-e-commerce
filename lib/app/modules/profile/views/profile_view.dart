import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/cart/view/cart_view.dart';
import 'package:opencommerce/app/modules/profile/controller/profile_controller.dart';
import 'package:opencommerce/app/modules/profile/views/profile_add_edit.dart';
import 'package:opencommerce/app/widgets/profile_photo/profile_photo_select.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = Get.context.height;
    var width = Get.context.width;
    return GetBuilder<UserProfileController>(
      init: UserProfileController(),
      builder: (value) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            elevation: 0,
            title: Text(
              "My Profile",
              style: TextStyle(fontSize: 18),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Get.off(() => ProfileAddEditView());
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Get.to(() => CartView());
                },
              ),
            ],
          ),
          body: value.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : value.profile != null
                  ? Container(
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 8),
                            color: Colors.orange,
                            height: height * 0.3,
                            width: width * 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SelectProfilePhoto(),
                                SizedBox(height: 10),
                                Text(
                                  value.profile.name,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "${value.profile.mobileNumber}",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                Text(
                                  value.profile.emailId,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 14),
                          Card(
                            child: Container(
                              padding: EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "My Address",
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.w700),
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.blue,
                                          ),
                                          onPressed: () {}),
                                    ],
                                  ),
                                  Divider(),
                                  Text(value.profile.name,
                                      style: TextStyle(fontSize: 20)),
                                  SizedBox(height: 8),
                                  Text(value.profile.addressLine),
                                  SizedBox(height: 5),
                                  Text(value.profile.landmark),
                                  SizedBox(height: 5),
                                  Text(value.profile.city),
                                  SizedBox(height: 5),
                                  Text(
                                      "${value.profile.state} - ${value.profile.pin}"),
                                  SizedBox(height: 8),
                                  Text("+91 ${value.profile.mobileNumber}"),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              padding: EdgeInsets.all(14),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("My Orders", style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w700),),
                                  Text("View all orders", style: TextStyle(color: Colors.blue),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: height * 0.15,
                              width: width * 0.3,
                              child: Icon(
                                Icons.person_add_alt_1_rounded,
                                size: 80,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              "Please update your profile",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
        );
      },
    );
  }
}

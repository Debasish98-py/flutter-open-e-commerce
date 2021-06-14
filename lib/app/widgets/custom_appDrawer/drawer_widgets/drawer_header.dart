import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/profile/controller/profile_controller.dart';

Widget createHeader() {
  return GetBuilder<UserProfileController>(
      init: UserProfileController(),
      builder: (val) {
        return DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('images/bgImage.jpg'))),
            child: Stack(children: [
              Positioned(
                  bottom: 12.0,
                  left: 16.0,
                  child: val.isBusy
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : val.profile != null
                          ? Text("Welcome ${val.profile.name}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500))
                          : Text("Welcome User",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500))),
            ]));
      });
}

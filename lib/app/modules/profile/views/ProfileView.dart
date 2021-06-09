import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/profile/controller/profile_controller.dart';
import 'package:opencommerce/app/modules/profile/views/profile_add_edit.dart';

class ProfileView extends GetView<UserProfileController> {
  var height = Get.context.height;
  var width = Get.context.width;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
      init: UserProfileController(),
      builder: (value) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            centerTitle: true,
            title: Text(
              "My Profile",
              style: TextStyle(fontSize: 18),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Get.off(
                    () => ProfileAddEditView(),
                  );
                },
              )
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
                          Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    value.profile.name ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Akaya Kanadaka",
                                      fontSize: 20,
                                    ),
                                  ),
                                  subtitle: Text("Name"),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        value.profile.emailId ?? '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Akaya Kanadaka",
                                          fontSize: 20,
                                        ),
                                      ),
                                      Icon(
                                        FontAwesomeIcons.checkCircle,
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                  subtitle: Text("Email Id"),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        value.profile.mobileNumber ?? '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Akaya Kanadaka",
                                          fontSize: 20,
                                        ),
                                      ),
                                      Icon(
                                        FontAwesomeIcons.checkCircle,
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                  subtitle: Text("Mobile Number"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    value.profile.addressLine ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Akaya Kanadaka",
                                      fontSize: 20,
                                    ),
                                  ),
                                  subtitle: Text("Address"),
                                ),
                                ListTile(
                                  title: Text(
                                    value.profile.landmark ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Akaya Kanadaka",
                                      fontSize: 20,
                                    ),
                                  ),
                                  subtitle: Text("Landmark"),
                                ),
                                ListTile(
                                  title: Text(
                                    value.profile.city ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Akaya Kanadaka",
                                      fontSize: 20,
                                    ),
                                  ),
                                  subtitle: Text("City"),
                                ),
                                ListTile(
                                  title: Text(
                                    value.profile.state ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Akaya Kanadaka",
                                      fontSize: 20,
                                    ),
                                  ),
                                  subtitle: Text("State"),
                                ),
                                ListTile(
                                  title: Text(
                                    value.profile.pin ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Akaya Kanadaka",
                                      fontSize: 20,
                                    ),
                                  ),
                                  subtitle: Text("PIN"),
                                ),
                              ],
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

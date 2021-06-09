import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/profile/controller/profile_controller.dart';
import 'package:opencommerce/app/modules/profile/views/profile_add_edit.dart';

class ProfileView extends GetView<UserProfileController> {
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
                  Get.to(
                    () => ProfileAddEditView(),
                  );
                },
              )
            ],
          ),
          body: value.isBusy ? Center(child: CircularProgressIndicator(),) : value.profile != null ? Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blue[300], Colors.blue[100]],
              ),
            ),
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Icon(
                  Icons.person,
                  size: 50,
                ),
                Card(
                  // color: const Color(0xffF27000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30),
                        ),
                  ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Icon(
                  Icons.house_rounded,
                  size: 30,
                ),
                Card(
                  // color: const Color(0xff89F200),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
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
          ) : Container(
            child: Center(
              child: Text("Please Update Your Profile"),
            ),
          ),
        );
      }
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/profile/controller/profile_controller.dart';
import 'package:opencommerce/app/modules/profile/controller/set_profile_controller.dart';
import 'package:opencommerce/app/modules/profile/views/profile_view.dart';

class ProfileAddEditView extends StatefulWidget {
  @override
  _ProfileAddEditViewState createState() => _ProfileAddEditViewState();
}

class _ProfileAddEditViewState extends State<ProfileAddEditView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetProfileController>(
      init: SetProfileController(),
      builder: (_controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                Get.off(() => ProfileView());
              },
            ),
            title: Text("Edit Profile"),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () async {
                    var form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      await _controller.setProfile();
                      Get.off(() => ProfileView());
                      Get.snackbar("Success!", "Profile updated successfully",
                          backgroundColor: Colors.white);
                    }
                  },
                ),
              )
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                Expanded(
                  child: GetBuilder<UserProfileController>(
                    init: UserProfileController(),
                    builder: (val) {
                      return Form(
                        key: _formKey,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Card(
                              child: Container(
                                child: TextFormField(
                                  initialValue: val.profile != null
                                      ? val.profile.name
                                      : "",
                                  decoration: InputDecoration(
                                    labelText: "Full Name",
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  validator: (value) => value.isEmpty
                                      ? "Please enter your name"
                                      : null,
                                  onSaved: (value) =>
                                      _controller.profile.name = value,
                                ),
                                padding: EdgeInsets.all(8),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Card(
                              child: Container(
                                child: TextFormField(
                                  initialValue: val.profile != null
                                      ? val.profile.emailId
                                      : "",
                                  decoration: InputDecoration(
                                    labelText: "Email Id",
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.mail),
                                  ),
                                  validator: (value) => value.isEmpty
                                      ? "Please enter your Email Id"
                                      : value.isValidEmail() ? null : "Please enter a valid Email",
                                  onSaved: (value) =>
                                      _controller.profile.emailId = value,
                                ),
                                padding: EdgeInsets.all(8),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Card(
                              child: Container(
                                child: TextFormField(
                                  initialValue: val.profile != null
                                      ? val.profile.mobileNumber
                                      : "",
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    labelText: "Mobile Number",
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.call),
                                  ),
                                  validator: (value) => value.isEmpty
                                      ? "Please enter your mobile number"
                                      : null,
                                  onSaved: (value) =>
                                      _controller.profile.mobileNumber = value,
                                ),
                                padding: EdgeInsets.all(8),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Card(
                              child: Container(
                                child: TextFormField(
                                  initialValue: val.profile != null
                                      ? val.profile.addressLine
                                      : "",
                                  keyboardType: TextInputType.streetAddress,
                                  decoration: InputDecoration(
                                    labelText: "Address Line",
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.add_road),
                                  ),
                                  validator: (value) => value.isEmpty
                                      ? "Please enter a valid address"
                                      : null,
                                  onSaved: (value) =>
                                      _controller.profile.addressLine = value,
                                ),
                                padding: EdgeInsets.all(8),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Card(
                              child: Container(
                                child: TextFormField(
                                  initialValue: val.profile != null
                                      ? val.profile.landmark
                                      : "",
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      labelText: "Landmark",
                                      border: InputBorder.none, prefixIcon: Icon(Icons.follow_the_signs),),
                                  validator: (value) => value.isEmpty
                                      ? "Please enter a Landmark"
                                      : null,
                                  onSaved: (value) =>
                                      _controller.profile.landmark = value,
                                ),
                                padding: EdgeInsets.all(8),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Card(
                              child: Container(
                                child: TextFormField(
                                  initialValue: val.profile != null
                                      ? val.profile.city
                                      : "",
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      labelText: "City",
                                      border: InputBorder.none, prefixIcon: Icon(Icons.location_city),),
                                  validator: (value) => value.isEmpty
                                      ? "Please enter your City"
                                      : null,
                                  onSaved: (value) =>
                                      _controller.profile.city = value,
                                ),
                                padding: EdgeInsets.all(8),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Card(
                              child: Container(
                                child: TextFormField(
                                  initialValue: val.profile != null
                                      ? val.profile.state
                                      : "",
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      labelText: "State",
                                      border: InputBorder.none, prefixIcon: Icon(Icons.location_pin),),
                                  validator: (value) => value.isEmpty
                                      ? "Please enter your state"
                                      : null,
                                  onSaved: (value) =>
                                      _controller.profile.state = value,
                                ),
                                padding: EdgeInsets.all(8),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Card(
                              child: Container(
                                child: TextFormField(
                                  initialValue: val.profile != null
                                      ? val.profile.pin
                                      : "",
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: "PIN",
                                      border: InputBorder.none, prefixIcon: Icon(CupertinoIcons.textformat_123),),
                                  validator: (value) => value.isEmpty
                                      ? "Please enter a valid PIN"
                                      : null,
                                  onSaved: (value) =>
                                      _controller.profile.pin = value,
                                ),
                                padding: EdgeInsets.all(10),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
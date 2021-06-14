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
  /// form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetProfileController>(
      init: SetProfileController(),
      builder: (_controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                Get.off(() => ProfileView());
              },
            ),
            title: Text("Profile"),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () async {
                    var form = _formKey.currentState;
                    if (form.validate()){
                      form.save();
                      await _controller.setProfile();
                      Get.off(() => ProfileView());
                      Get.snackbar("Success!", "Profile updated");
                    }
                  },
                ),
              )
            ],
          ),
          body: Container(
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
                            TextFormField(
                              initialValue: val.profile != null ? val.profile.name : "",
                              decoration:
                                  InputDecoration(labelText: "Full Name"),
                              validator: (value) => value.isEmpty
                                  ? "Please enter your name"
                                  : null,
                              onSaved: (value) =>
                                  _controller.profile.name = value,
                            ),
                            TextFormField(
                              initialValue: val.profile != null ? val.profile.emailId : "",
                              decoration:
                                  InputDecoration(labelText: "Email Id"),
                              validator: (value) => value.isEmpty
                                  ? "Please enter your email Id"
                                  : null,
                              onSaved: (value) =>
                                  _controller.profile.emailId = value,
                            ),
                            TextFormField(
                              initialValue: val.profile != null ? val.profile.mobileNumber : "",
                              keyboardType: TextInputType.phone,
                              decoration:
                                  InputDecoration(labelText: "Mobile Number"),
                              validator: (value) => value.isEmpty
                                  ? "Please enter your mobile number"
                                  : null,
                              onSaved: (value) =>
                                  _controller.profile.mobileNumber = value,
                            ),
                            TextFormField(
                              initialValue: val.profile != null ? val.profile.addressLine : "",
                              keyboardType: TextInputType.streetAddress,
                              decoration:
                                  InputDecoration(labelText: "Address Line"),
                              validator: (value) => value.isEmpty
                                  ? "Please enter a valid address"
                                  : null,
                              onSaved: (value) =>
                                  _controller.profile.addressLine = value,
                            ),
                            TextFormField(
                              initialValue: val.profile != null ? val.profile.landmark : "",
                              keyboardType: TextInputType.text,
                              decoration:
                                  InputDecoration(labelText: "Landmark"),
                              validator: (value) => value.isEmpty
                                  ? "Please enter a Landmark"
                                  : null,
                              onSaved: (value) =>
                                  _controller.profile.landmark = value,
                            ),
                            TextFormField(
                              initialValue: val.profile != null ? val.profile.city : "",
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(labelText: "City"),
                              validator: (value) => value.isEmpty
                                  ? "Please enter your City"
                                  : null,
                              onSaved: (value) =>
                                  _controller.profile.city = value,
                            ),
                            TextFormField(
                              initialValue: val.profile != null ? val.profile.state : "",
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(labelText: "State"),
                              validator: (value) => value.isEmpty
                                  ? "Please enter your state"
                                  : null,
                              onSaved: (value) =>
                                  _controller.profile.state = value,
                            ),
                            TextFormField(
                              initialValue: val.profile != null ? val.profile.pin : "",
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(labelText: "PIN"),
                              validator: (value) => value.isEmpty
                                  ? "Please enter a valid PIN"
                                  : null,
                              onSaved: (value) =>
                                  _controller.profile.pin = value,
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

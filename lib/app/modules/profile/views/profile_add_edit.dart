import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/profile/controller/set_profile_controller.dart';
import 'package:opencommerce/app/modules/profile/profile_model.dart';
import 'package:opencommerce/app/modules/profile/views/ProfileView.dart';

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
            title: Text("Profile"),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () async {
                    var form = _formKey.currentState;

                    ///
                    /// 1. Validate the form data by calling form.validate()
                    if (form.validate()) {
                      /// 2. Save the form fields value by calling form.save()
                      form.save();

                      /// 3. Save data to the server/ database by calling service.save()
                      /// get firebase auth uid
                      await _controller.setProfile();
                      // var user = FirebaseAuth.instance.currentUser;
                      // if (user != null) {
                      //   try {
                      //     await FirebaseFirestore.instance
                      //         .collection("profiles")
                      //         .doc(user.uid)
                      //         .set(widget.profile.toMap());
                      //     Navigator.pop(context);
                      //     Navigator.pushReplacement(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 ProfileView(widget.profile)));
                      //   } catch (e) {
                      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //       content: Text('Something went wrong!!!'),
                      //       duration: Duration(seconds: 3),
                      //     ));
                      //     // final snackBar = SnackBar(
                      //     //     backgroundColor: Colors.red,
                      //     //     content: Text('Sorry! something went wrong'));
                      //     //
                      //     // ///ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //   }
                      // } else {}
                    }
                    Get.snackbar("Success!", "Profile updated");
                  },
                ),
              )
            ],
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        TextFormField(
                          initialValue: "" ??
                              FirebaseAuth.instance.currentUser.displayName,
                          decoration: InputDecoration(labelText: "Full Name"),
                          validator: (value) =>
                              value.isEmpty ? "Please enter your name" : null,
                          onSaved: (value) => _controller.profile.name = value,
                        ),
                        TextFormField(
                          initialValue: "" ??
                              FirebaseAuth.instance.currentUser.email,
                          decoration: InputDecoration(labelText: "Email Id"),
                          validator: (value) =>
                              value.isEmpty ? "Please enter your email Id" : null,
                          onSaved: (value) => _controller.profile.emailId = value,
                        ),
                        TextFormField(
                          initialValue: "" ??
                              FirebaseAuth.instance.currentUser.phoneNumber,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(labelText: "Mobile Number"),
                          validator: (value) => value.isEmpty
                              ? "Please enter your mobile number"
                              : null,
                          onSaved: (value) => _controller.profile.mobileNumber = value,
                        ),
                        TextFormField(
                          initialValue: "",
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(labelText: "Address Line"),
                          validator: (value) => value.isEmpty
                              ? "Please enter a valid address"
                              : null,
                          onSaved: (value) => _controller.profile.addressLine = value,
                        ),
                        TextFormField(
                          initialValue: "",
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Landmark"),
                          validator: (value) =>
                              value.isEmpty ? "Please enter a Landmark" : null,
                          onSaved: (value) => _controller.profile.landmark = value,
                        ),
                        TextFormField(
                          initialValue: "",
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "City"),
                          validator: (value) =>
                              value.isEmpty ? "Please enter your City" : null,
                          onSaved: (value) => _controller.profile.city = value,
                        ),
                        TextFormField(
                          initialValue: "",
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "State"),
                          validator: (value) =>
                              value.isEmpty ? "Please enter your state" : null,
                          onSaved: (value) => _controller.profile.state = value,
                        ),
                        TextFormField(
                          initialValue: "",
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: "PIN"),
                          validator: (value) =>
                              value.isEmpty ? "Please enter a valid PIN" : null,
                          onSaved: (value) => _controller.profile.pin = value,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

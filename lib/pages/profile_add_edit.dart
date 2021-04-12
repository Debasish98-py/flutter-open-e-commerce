import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/profile_model.dart';
import 'package:opencommerce/pages/ProfileView.dart';

class ProfileAddEditView extends StatefulWidget {
  Profile profile = Profile();

  ProfileAddEditView({this.profile});

  @override
  _ProfileAddEditViewState createState() => _ProfileAddEditViewState();
}

class _ProfileAddEditViewState extends State<ProfileAddEditView> {
  /// form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    var user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      try {
                        await FirebaseFirestore.instance
                            .collection("profiles")
                            .doc(user.uid)
                            .set(widget.profile.toMap());
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProfileView(widget.profile)));
                      } catch (e) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Something went wrong!!!'),
                          duration: Duration(seconds: 3),
                        ));
                        // final snackBar = SnackBar(
                        //     backgroundColor: Colors.red,
                        //     content: Text('Sorry! something went wrong'));
                        //
                        // ///ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    } else {}
                  }
                },
              ),
            )
          ],
        ),
        body: Container(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  initialValue: widget.profile.name,
                  decoration: InputDecoration(labelText: "Full Name"),
                  validator: (value) =>
                      value.isEmpty ? "Please enter your name" : null,
                  onSaved: (value) => widget.profile.name = value,
                ),
                TextFormField(
                  initialValue: widget.profile.emailId,
                  decoration: InputDecoration(labelText: "Email Id"),
                  validator: (value) =>
                      value.isEmpty ? "Please enter your email Id" : null,
                  onSaved: (value) => widget.profile.emailId = value,
                ),
                TextFormField(
                  initialValue: widget.profile.mobileNumber,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: "Mobile Number"),
                  validator: (value) =>
                      value.isEmpty ? "Please enter your mobile number" : null,
                  onSaved: (value) => widget.profile.mobileNumber = value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

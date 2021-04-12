import 'package:flutter/material.dart';
import 'package:opencommerce/models/profile_model.dart';
import 'package:opencommerce/pages/profile_add_edit.dart';

class ProfileView extends StatelessWidget {
  final Profile _profile;

  ProfileView(this._profile);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true,
          title: Text("My Profile", style: TextStyle(fontSize: 18),),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProfileAddEditView(profile: _profile)));
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Icon(Icons.person),
              ListTile(
                title: Text(
                  _profile.name ?? '',
                ),
                subtitle: Text("Full Name"),
              ),
              ListTile(
                title: Text(
                  _profile.emailId ?? '',
                ),
                subtitle: Text("Email Id"),
              ),
              ListTile(
                title: Text(
                  _profile.mobileNumber ?? '',
                ),
                subtitle: Text("Mobile Number"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
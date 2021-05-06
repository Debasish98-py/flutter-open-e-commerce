import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "My Profile",
            style: TextStyle(fontSize: 18),
          ),
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
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Icon(
                Icons.person,
                size: 50,
              ),
              Card(
                color: const Color(0xffF27000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)
                      // topLeft: Radius.circular(40),
                      // bottomRight: Radius.circular(40),
                      ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        _profile.name ?? '',
                      ),
                      subtitle: Text("Full Name"),
                    ),

                    ///kakku
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
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.house_rounded,
                size: 30,
              ),
              Card(
                color: const Color(0xff89F200),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)
                      // topLeft: Radius.circular(40),
                      // bottomRight: Radius.circular(40),
                      ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        _profile.addressLine ?? '',
                      ),
                      subtitle: Text("Address"),
                    ),
                    ListTile(
                      title: Text(
                        _profile.landmark ?? '',
                      ),
                      subtitle: Text("Landmark"),
                    ),
                    ListTile(
                      title: Text(
                        _profile.city ?? '',
                      ),
                      subtitle: Text("City"),
                    ),
                    ListTile(
                      title: Text(
                        _profile.state ?? '',
                      ),
                      subtitle: Text("State"),
                    ),
                    ListTile(
                      title: Text(
                        _profile.pin ?? '',
                      ),
                      subtitle: Text("PIN"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

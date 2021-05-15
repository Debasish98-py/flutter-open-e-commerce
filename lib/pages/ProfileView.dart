
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opencommerce/models/profile_model.dart';
import 'package:opencommerce/pages/profile_add_edit.dart';

class ProfileView extends StatefulWidget {
  final Profile profile;

  ProfileView(this.profile);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfileAddEditView(profile: widget.profile)));
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.blue[300], Colors.blue[100]],
        )),
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
                borderRadius: BorderRadius.all(Radius.circular(30)
                    // topLeft: Radius.circular(40),
                    // bottomRight: Radius.circular(40),
                    ),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      widget.profile.name ?? '',
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
                          widget.profile.emailId ?? '',
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
                          widget.profile.mobileNumber ?? '',
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
                borderRadius: BorderRadius.all(Radius.circular(30)
                    // topLeft: Radius.circular(40),
                    // bottomRight: Radius.circular(40),
                    ),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      widget.profile.addressLine ?? '',
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
                      widget.profile.landmark ?? '',
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
                      widget.profile.city ?? '',
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
                      widget.profile.state ?? '',
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
                      widget.profile.pin ?? '',
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
      ),
    );
  }
}

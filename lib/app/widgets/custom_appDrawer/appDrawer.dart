import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/cart/view/cart_view.dart';
import 'package:opencommerce/app/modules/product/views/product_add_edit.dart';
import 'package:opencommerce/app/modules/profile/views/profile_view.dart';
import 'package:opencommerce/app/modules/profile/views/profile_add_edit.dart';
import 'package:opencommerce/app/widgets/custom_appDrawer/drawer_widgets/drawer_header.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          createHeader(),
          ListTile(
            leading: Icon(CupertinoIcons.square_grid_2x2_fill),
            title: Text("All Categories"),
          ),
          Divider(),
          ListTile(
            leading: Icon(FontAwesomeIcons.firstOrder),
            title: Text("My Orders"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.shoppingCart),
            title: Text("My Cart"),
            onTap: (){
              Get.to(() => CartView());
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.list),
            title: Text("My Wishlist"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.users),
            title: Text("My Account"),
            onTap: (){
              Get.to(() => ProfileView());
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.bell),
            title: Text("My Notifications"),
          ),
          Divider(),
          ListTile(
            leading: Icon(FontAwesomeIcons.userShield),
            title: Text("Administration"),
            onTap: (){
              Get.to(() => ProductAddEdit());
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.share),
            title: Text("Invite Friends"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.phone),
            title: Text("Contact Us"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.signOutAlt),
            title: Text("Log Out"),
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}

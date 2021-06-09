import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/profile/controller/profile_controller.dart';

class TestProfileView extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
      init: UserProfileController(),
      builder: (val) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Test Profile View"
            ),
          ),
          body: val.isBusy ? Center(
            child: CircularProgressIndicator(),
          ) : val.profile != null ?
              Container(
                child: Center(
                  child: Text(
                    val.profile.name
                  ),
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

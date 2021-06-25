import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/app/modules/profile/controller/profile_photo_controller.dart';

// ignore: non_constant_identifier_names
Widget SelectProfilePhoto(){
  var height = Get.context.height;
  return GetBuilder<ProfileImage>(
    init: ProfileImage(),
    builder: (_value) => GestureDetector(
      child: CircleAvatar(
        radius: 68,
        child: _value.save.read("key") != null ?
        ClipRRect(
          borderRadius: BorderRadius.circular(68),
          child: Image.file(
            File(_value.save.read("key")),
            width: 136,
            height: 136,
            fit: BoxFit.cover,
          ),
        ) : ClipRRect(
          borderRadius: BorderRadius.circular(68),
          child: Container(
            width: 136,
            height: 136,
            color: Colors.grey[200],
            child: Icon(
              Icons.camera_alt_outlined,
              color: Colors.grey[800],
            ),
          ),
        ),
      ),
      onTap: (){
        Get.bottomSheet(
          Container(
            height: height * 0.2,
            color: Colors.orangeAccent[200],
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select Profile Photo",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.camera, size: 40, color: Colors.blue,),
                          Text("Camera", style: TextStyle(color: Colors.white, fontSize: 15),),
                        ],
                      ),
                      onTap: (){
                        _value.cameraImage();
                        Get.back();
                      },
                    ),
                    GestureDetector(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.folder, size: 40, color: Colors.greenAccent,),
                          Text("Gallery", style: TextStyle(color: Colors.white, fontSize: 15),),
                        ],
                      ),
                      onTap: (){
                        _value.galleryImage();
                        Get.back();
                      },
                    ),
                    Visibility(
                      visible: _value.save.read("key") != null,
                      child: GestureDetector(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.delete, size: 40, color: Colors.red,),
                            Text("Remove Photo", style: TextStyle(color: Colors.white, fontSize: 15),),
                          ],
                        ),
                        onTap: (){
                          _value.deleteImage();
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
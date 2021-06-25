import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends GetxController {
  final save = GetStorage();

  Future cameraImage() async {
    var cameraPhoto = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);

    if (cameraPhoto != null) {
      save.write("key", cameraPhoto.path);
      update();
    } else {
      Get.snackbar(
        "No image selected",
        "Select an image",
        backgroundColor: Colors.grey,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future galleryImage() async {
    var galleryPhoto = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);

    if (galleryPhoto != null) {
      save.write("key", galleryPhoto.path);
      update();
    } else {
      Get.snackbar(
        "No image selected",
        "Select an image",
        backgroundColor: Colors.grey,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  deleteImage(){
    if(save!=null){
      save.remove("key");
      update();
    }
  }
}

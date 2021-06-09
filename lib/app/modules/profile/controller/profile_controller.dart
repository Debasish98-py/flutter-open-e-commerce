import 'package:get/get.dart';
import 'package:opencommerce/app/modules/profile/profile_model.dart';
import 'package:opencommerce/app/modules/profile/service/profile_service.dart';

class UserProfileController extends GetxController{
  final ProfileService _profileService = ProfileService();
  Profile _profile;
  Profile get profile => _profile;
  bool isBusy = true;

  @override
  void onReady() async{
    isBusy = true;
    update();
    _profile = await _profileService.getUserProfile();
    isBusy = false;
    update();
    super.onReady();
  }
}



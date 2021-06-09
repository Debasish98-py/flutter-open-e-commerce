import 'package:get/get.dart';
import 'package:opencommerce/app/modules/profile/profile_model.dart';
import 'package:opencommerce/app/modules/profile/provider/profile_provider.dart';

class ProfileService extends GetxService{
  final _profileProvider = ProfileProvider();

  Future<Profile> getUserProfile() =>
      _profileProvider.getProfile().then((value) => value);
}
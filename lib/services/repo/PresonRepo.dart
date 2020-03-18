import 'package:flutter_app_pyco/model/Profile.dart';

abstract class PresonRepo {
  Future<void> getProfileByLocation(String location);

  Future<void> saveProfile(Profile profile);

}

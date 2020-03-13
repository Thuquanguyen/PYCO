import 'package:flutter_app_pyco/model/Profile.dart';

abstract class ProfileRepo {
  Future<void> getProfileByLocation(String location);

  Future<void> saveProfile(Profile profile);

  Future<List<Profile>> getProfilesFavorite();
}

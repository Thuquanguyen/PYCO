import 'dart:async';

import 'package:flutter_app_pyco/bloc/BlocBase.dart';
import 'package:flutter_app_pyco/data/local/ProfileDAO.dart';
import 'package:flutter_app_pyco/data/remote/ProfileAPI.dart';
import 'package:flutter_app_pyco/model/Profile.dart';
import 'package:flutter_app_pyco/repo/ProfileRepo.dart';
import 'package:flutter_app_pyco/utils/Toast.dart';

class ProfileRepoImpl extends BlocBase with ProfileRepo {

  ProfileRepoImpl._internal();

  static final ProfileRepoImpl _instance = ProfileRepoImpl._internal();

  static ProfileRepoImpl get instance => _instance;

  final StreamController<Profile> _streamController =
  StreamController.broadcast();

  Stream<Profile> get profileStream => _streamController.stream;

  final StreamController<List<Profile>> _favoriteController =
  StreamController.broadcast();

  Stream<List<Profile>> get favoriteStream => _favoriteController.stream;

  ProfileApi profileApi = ProfileApi();

  ProfileDao profileLocal = ProfileDao.instance;

  @override
  Future<void> getProfileByLocation(String location) async {
    Profile profile = await profileApi.findProfileByLocation(location);
    if (profile == null) {
      _streamController.sink.addError("error");
    } else {
      _streamController.sink.add(profile);
    }
    print("Profile : ${profile.username}\nProfile : ${profile.picture}");
  }

  @override
  Future<List<Profile>> getProfilesFavorite() async {
    List<Profile> profiles = await profileLocal.queryAllStation();
    if (profiles == null) {
      _favoriteController.sink.addError("error");
    } else {
      _favoriteController.sink.add(profiles);
    }
    return profiles;
  }

  @override
  Future<void> saveProfile(Profile profile) async {
    Profile _profile = Profile(
        seed: profile.seed,
        email: profile.email,
        first: profile.first,
        last: profile.last,
        title: profile.title,
        picture: profile.picture);
    List<Profile> profiles = await profileLocal.queryAllStation();
    int count = 0;
    for (var item in profiles) {
      if (_profile.seed == item.seed) {
        count++;
      }
    }
    if (count != 0) {
      showToast("Người dùng đã có trong mục yêu thích");
    } else {
      await profileLocal.insert(_profile);
      showToast("Người dùng đã được thêm vào mục yêu thích");
    }
  }

  @override
  void dispose() {
    _streamController.close();
    _favoriteController.close();
  }
}

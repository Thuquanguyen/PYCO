import 'dart:async';
import 'dart:convert';

import 'package:flutter_app_pyco/model/Profile.dart';
import 'package:flutter_app_pyco/model/ProfileFromApi.dart';
import 'package:flutter_app_pyco/services/bloc/BlocBase.dart';
import 'package:flutter_app_pyco/services/remote/PersonProvider.dart';
import 'package:flutter_app_pyco/services/repo/PresonRepo.dart';
import 'package:flutter_app_pyco/utils/Toast.dart';

import '../services/local/DatabaseHelper.dart';

class PresonViewModel extends BlocBase with PresonRepo {
  PresonViewModel._internal();

  static final PresonViewModel _instance = PresonViewModel._internal();

  static PresonViewModel get instance => _instance;

  final StreamController<Profile> _streamController =
      StreamController.broadcast();

  Stream<Profile> get profileStream => _streamController.stream;

  PersonProvider profileApi = PersonProvider();

  DatabaseHelper profileLocal = DatabaseHelper.instance;

  @override
  Future<void> getProfileByLocation(String location) async {
    Profile profile = await profileApi.findProfileByLocation(location);
    if (profile == null) {
      _streamController.sink.addError("error");
    } else {
      _streamController.sink.add(profile);
    }
  }

  @override
  Future<void> saveProfile(Profile profile) async {
    Profile _profile = Profile(
        seed: profile.seed,
        email: profile.email,
        first: profile.first,
        last: profile.last,
        title: profile.title,
        large: profile.large);
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

  List<ProfileFromApi> parseJosn(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed
        .map<ProfileFromApi>((json) => new ProfileFromApi.fromJson(json))
        .toList();
  }

  @override
  void dispose() {
    _streamController.close();
  }
}

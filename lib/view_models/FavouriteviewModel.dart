import 'dart:async';

import 'package:flutter_app_pyco/model/Profile.dart';
import 'package:flutter_app_pyco/services/bloc/BlocBase.dart';
import 'package:flutter_app_pyco/services/remote/PersonProvider.dart';
import 'package:flutter_app_pyco/services/repo/FavouriteRepo.dart';

import '../services/local/DatabaseHelper.dart';

class FavouriteViewModel extends BlocBase with FavouriteRepo {
  FavouriteViewModel._internal();

  static final FavouriteViewModel _instance = FavouriteViewModel._internal();

  static FavouriteViewModel get instance => _instance;

  final StreamController<List<Profile>> _favoriteController =
      StreamController.broadcast();

  Stream<List<Profile>> get favoriteStream => _favoriteController.stream;

  PersonProvider profileApi = PersonProvider();

  DatabaseHelper profileLocal = DatabaseHelper.instance;

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
  void dispose() {
    _favoriteController.close();
  }
}

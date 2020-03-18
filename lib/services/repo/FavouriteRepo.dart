import 'package:flutter_app_pyco/model/Profile.dart';

abstract class FavouriteRepo {
  Future<List<Profile>> getProfilesFavorite();
}

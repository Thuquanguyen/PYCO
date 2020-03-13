import 'dart:convert';

import 'package:flutter_app_pyco/model/Profile.dart';
import 'package:flutter_app_pyco/model/ProfileFromApi.dart';
import 'package:flutter_app_pyco/utils/NetworkUtil.dart';
import 'package:http/http.dart';

class ProfileApi {
  var client = Client();

  Future<Profile> findProfileByLocation(String location) async {
    String url = BASE_URL;
    var response;
    try {
      response = await client.get(url);
    } on Exception {
      print("client exceltion");
      return null;
    }

    if (response.statusCode == 200) {
      ProfileFromApi profileFromApi;
      try {
        profileFromApi = ProfileFromApi.fromJson(json.decode(response.body));
      } on FormatException {
        print("json format exception");
      }
      return profileFromApi?.toProfile();
    } else {
      print("request error: ${response.body}");
      return null;
    }
  }
}

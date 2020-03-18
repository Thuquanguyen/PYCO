import 'dart:convert';

import 'package:flutter_app_pyco/model/Profile.dart';
import 'package:flutter_app_pyco/model/ProfileFromApi.dart';
import 'package:flutter_app_pyco/utils/NetworkUtil.dart';
import 'package:http/http.dart';

class ProfileApi {
  var client = Client();

  Future<Profile> findProfileByLocation(String location) async {
    String url = BASE_URL;
    var response = '''
    {
  "results": [
    {
      "gender": "female",
      "name": {
        "title": "miss",
        "first": "ramona",
        "last": "carter"
      },
      "location": {
        "street": "2286 frances ct",
        "city": "townsville",
        "state": "queensland",
        "postcode": 6699
      },
      "email": "ramona.carter@example.com",
      "login": {
        "username": "bigrabbit281",
        "password": "salvador",
        "salt": "NgEKDglD",
        "md5": "8946b15e0a5411bfdb52df5ac1b90520",
        "sha1": "f460f12a714919499d413a69a76ca2f262e9c198",
        "sha256": "fbb37b276b0900fcfdcfc47f0584f9859726c3791b9b0e453dbac8178be26412"
      },
      "dob": "1977–05–01 13:29:43",
      "registered": "2009–05–12 00:46:03",
      "phone": "08–4889–2804",
      "cell": "0479–076–830",
      "id": {
        "name": "TFN",
        "value": "212902602"
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/90.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/90.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/90.jpg"
      },
      "nat": "AU"
    }
  ],
  "info": {
    "seed": "7d4db9727474515a",
    "results": 1,
    "page": 1,
    "version": "1.1"
  }
}
    ''';
//    try {
//      response = await client.get(url);
//    } on Exception {
//      print("client exceltion");
//      return null;
//    }

//    if (response.statusCode == 200) {
    ProfileFromApi profileFromApi;
    try {
      profileFromApi = ProfileFromApi.fromJson(json.decode(response));
    } on FormatException {
      print("json format exception");
      }
      return profileFromApi?.toProfile();
//    }
//    else {
//    print("request error: ${response.body}");
//    return null;
//    }
  }
}

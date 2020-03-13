import 'package:flutter_app_pyco/model/Profile.dart';

class ProfileFromApi {
  List<Result> results;

  ProfileFromApi({this.results});

  factory ProfileFromApi.fromJson(Map<String, dynamic> json) {
    return ProfileFromApi(
      results: json['results'] != null
          ? (json['results'] as List).map((i) => Result.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Profile toProfile() {
    return Profile(
        seed: results[0].seed,
        cell: results[0].user.cell,
        dob: null,
        email: results[0].user.email,
        gender: results[0].user.gender,
        city: results[0].user.location.city,
        state: results[0].user.location.state,
        street: results[0].user.location.street,
        zip: results[0].user.location.zip,
        md5: results[0].user.md5,
        first: results[0].user.name.first,
        last: results[0].user.name.last,
        title: results[0].user.name.title,
        password: results[0].user.password,
        phone: results[0].user.phone,
        picture: results[0].user.picture,
        registered: results[0].user.registered,
        sSN: results[0].user.sSN,
        salt: results[0].user.salt,
        sha1: results[0].user.sha1,
        sha256: results[0].user.sha256,
        username: results[0].user.username,
        version: results[0].version);
  }
}

class Result {
  String seed;
  User user;
  String version;

  Result({this.seed, this.user, this.version});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      seed: json['seed'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      version: json['version'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seed'] = this.seed;
    data['version'] = this.version;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String cell;
  String dob;
  String email;
  String gender;
  Location location;
  String md5;
  Name name;
  String password;
  String phone;
  String picture;
  String registered;
  String sSN;
  String salt;
  String sha1;
  String sha256;
  String username;

  User(
      {this.cell,
      this.dob,
      this.email,
      this.gender,
      this.location,
      this.md5,
      this.name,
      this.password,
      this.phone,
      this.picture,
      this.registered,
      this.sSN,
      this.salt,
      this.sha1,
      this.sha256,
      this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      cell: json['cell'],
      dob: json['dob'],
      email: json['email'],
      gender: json['gender'],
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      md5: json['md5'],
      name: json['name'] != null ? Name.fromJson(json['name']) : null,
      password: json['password'],
      phone: json['phone'],
      picture: json['picture'],
      registered: json['registered'],
      sSN: json['sSN'],
      salt: json['salt'],
      sha1: json['sha1'],
      sha256: json['sha256'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cell'] = this.cell;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['md5'] = this.md5;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['picture'] = this.picture;
    data['registered'] = this.registered;
    data['sSN'] = this.sSN;
    data['salt'] = this.salt;
    data['sha1'] = this.sha1;
    data['sha256'] = this.sha256;
    data['username'] = this.username;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    return data;
  }
}

class Location {
  String city;
  String state;
  String street;
  String zip;

  Location({this.city, this.state, this.street, this.zip});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      city: json['city'],
      state: json['state'],
      street: json['street'],
      zip: json['zip'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['state'] = this.state;
    data['street'] = this.street;
    data['zip'] = this.zip;
    return data;
  }
}

class Name {
  String first;
  String last;
  String title;

  Name({this.first, this.last, this.title});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      first: json['first'],
      last: json['last'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['title'] = this.title;
    return data;
  }
}

import 'package:flutter/cupertino.dart';

class Profile {
  String seed;
  String cell;
  String dob;
  String email;
  String gender;
  String city;
  String state;
  String street;
  String zip;
  String md5;
  String first;
  String last;
  String title;
  String password;
  String phone;
  String picture;
  String registered;
  String sSN;
  String salt;
  String sha1;
  String sha256;
  String username;
  String version;

  Profile(
      {@required this.seed,
      @required this.cell,
      @required this.dob,
      @required this.email,
      @required this.gender,
      @required this.city,
      @required this.state,
      @required this.street,
      @required this.zip,
      @required this.md5,
      @required this.first,
      @required this.last,
      @required this.title,
      @required this.password,
      @required this.phone,
      @required this.picture,
      @required this.registered,
      @required this.sSN,
      @required this.salt,
      @required this.sha1,
      @required this.sha256,
      @required this.username,
      @required this.version});

  Map<String, dynamic> toMap() {
    return {
      'seed': this.seed,
      'email': this.email,
      'first': this.first,
      'last': this.last,
      'title': this.title,
      'picture': this.picture,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return new Profile(
      seed: map['seed'] as String,
      email: map['email'] as String,
      first: map['first'] as String,
      last: map['last'] as String,
      title: map['title'] as String,
      picture: map['picture'] as String,
    );
  }
}

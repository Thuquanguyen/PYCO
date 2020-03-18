import 'package:flutter/material.dart';
import 'package:flutter_app_pyco/model/Profile.dart';
import 'package:flutter_app_pyco/services/inherited/ProfileInherited.dart';
import 'package:flutter_app_pyco/views/widgets/ProfileItem.dart';

class ProfileScreen extends StatelessWidget {
  // MARK: - VARIABLE
  static const routerName = "/profile";

  @override
  Widget build(BuildContext context) {
    var inherited = ProfileInherited.of(context);
    Profile profile = inherited.profile;

    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(height: height / 4, color: Colors.black),
          Container(
              child: ProfileItem(profile: profile),
              padding: EdgeInsets.only(top: height / 10))
        ],
      ),
    );
  }
}

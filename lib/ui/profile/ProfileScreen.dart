import 'package:flutter/material.dart';
import 'package:flutter_app_pyco/inherited/ProfileInherited.dart';
import 'package:flutter_app_pyco/model/Profile.dart';
import 'package:flutter_app_pyco/ui/ProfileItem.dart';

class ProfileScreen extends StatelessWidget {
  // MARK: - VARIABLE
  static const routerName = "/profile"; // Create router for Profile page

  // MARK: LIFE CYCLE
  @override
  Widget build(BuildContext context) {
    final inherited = ProfileInherited.of(context);
    final Profile profile = inherited.profile;
    final height = MediaQuery
        .of(context)
        .size
        .height;

    return Container(
      margin: EdgeInsets.only(top: height / 10),
      child: Center(
        child: ProfileItem(profile: profile),
      ),
    );
  }

// MARK: - FUNCTION

// MARK: - ACTION
}

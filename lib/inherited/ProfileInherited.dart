import 'package:flutter/cupertino.dart';
import 'package:flutter_app_pyco/model/Profile.dart';

class ProfileInherited extends InheritedWidget {
  final Profile profile;

  ProfileInherited({@required this.profile, @required Widget child})
      : super(child: child);

  static ProfileInherited of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ProfileInherited);
  }

  @override
  bool updateShouldNotify(ProfileInherited oldWidget) {
    // TODO: implement updateShouldNotify
    return profile != oldWidget.profile;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app_pyco/ui/favorite/FavoriteScreen.dart';
import 'package:flutter_app_pyco/ui/home/HomeScreen.dart';
import 'package:flutter_app_pyco/ui/profile/ProfileScreen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "PYCO",
        home: HomeScreen(),
        routes: {
          HomeScreen.routerName: (_) => HomeScreen(),
          FavoriteScreen.routerName: (_) => FavoriteScreen(),
          ProfileScreen.routerName: (_) => ProfileScreen(),
        });
  }
}


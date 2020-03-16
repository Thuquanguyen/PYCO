import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pyco/data/ProfileRepoImpl.dart';
import 'package:flutter_app_pyco/ui/favorite/FavoriteScreen.dart';
import 'package:flutter_app_pyco/ui/home/HomeScreen.dart';
import 'package:flutter_app_pyco/ui/profile/ProfileScreen.dart';
import 'package:flutter_app_pyco/utils/AppConnectivity.dart';

import 'bloc/BlocProvider.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ProfileRepoImpl _bloc = ProfileRepoImpl.instance;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: "PYCO",
        home: BlocProvider(child: HomeScreen(), bloc: _bloc),
        routes: {
          HomeScreen.routerName: (_) => HomeScreen(),
          FavoriteScreen.routerName: (_) => FavoriteScreen(),
          ProfileScreen.routerName: (_) => ProfileScreen(),
        });
  }
}

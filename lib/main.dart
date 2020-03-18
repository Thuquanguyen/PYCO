import 'package:flutter/material.dart';
import 'package:flutter_app_pyco/services/bloc/BlocProvider.dart';
import 'package:flutter_app_pyco/view_models/PresonViewModel.dart';
import 'package:flutter_app_pyco/views/HomeScreen.dart';
import 'package:flutter_app_pyco/views/pages/FavoriteScreen.dart';
import 'package:flutter_app_pyco/views/pages/ProfileScreen.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  PresonViewModel _bloc = PresonViewModel.instance;

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

import 'package:flutter/material.dart';
import 'package:flutter_app_pyco/bloc/BlocProvider.dart';
import 'package:flutter_app_pyco/data/ProfileRepoImpl.dart';
import 'package:flutter_app_pyco/ui/favorite/FavoriteScreen.dart';
import 'package:flutter_app_pyco/ui/home/HomeScreen.dart';
import 'package:flutter_app_pyco/ui/profile/ProfileScreen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ProfileRepoImpl bloc = ProfileRepoImpl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "PYCO",
        home: BlocProvider(child: HomeScreen(), bloc: bloc),
        routes: {
          HomeScreen.routerName: (_) => HomeScreen(),
          FavoriteScreen.routerName: (_) => FavoriteScreen(),
          ProfileScreen.routerName: (_) => ProfileScreen(),
        });
  }
}

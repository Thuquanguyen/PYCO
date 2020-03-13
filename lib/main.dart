import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pyco/data/ProfileRepoImpl.dart';
import 'package:flutter_app_pyco/ui/favorite/FavoriteScreen.dart';
import 'package:flutter_app_pyco/ui/home/HomeScreen.dart';
import 'package:flutter_app_pyco/ui/profile/ProfileScreen.dart';
import 'package:flutter_app_pyco/utils/AppConnectivity.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ProfileRepoImpl bloc = ProfileRepoImpl();

  Map _source = {ConnectivityResult.none: false};

  AppConnectivity _connectivity = AppConnectivity.instance;

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    _connectivity.initialise();
    _connectivity.connectStream.listen((source) {
      setState(() => _source = source);
    });
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String string;
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.none:
        string = "Offline";
        break;
      case ConnectivityResult.mobile:
        string = "Mobile: Online";
        break;
      case ConnectivityResult.wifi:
        string = "WiFi: Online";
    }
    return MaterialApp(
        title: "PYCO",
        home: Center(child: Text("$string", style: TextStyle(fontSize: 36))),
        routes: {
          HomeScreen.routerName: (_) => HomeScreen(),
          FavoriteScreen.routerName: (_) => FavoriteScreen(),
          ProfileScreen.routerName: (_) => ProfileScreen(),
        });
  }
}

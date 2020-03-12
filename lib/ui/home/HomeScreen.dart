import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routerName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Home Screen")),
      ),
    );
  }
}

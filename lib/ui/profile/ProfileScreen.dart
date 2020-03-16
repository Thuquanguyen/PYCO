import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pyco/data/ProfileRepoImpl.dart';
import 'package:flutter_app_pyco/model/Profile.dart';
import 'package:flutter_app_pyco/ui/ProfileItem.dart';
import 'package:flutter_app_pyco/utils/AppConnectivity.dart';
import 'package:flutter_app_pyco/utils/NetworkUtil.dart';

class ProfileScreen extends StatefulWidget {
  // MARK: - VARIABLE
  static const routerName = "/profile";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  ProfileRepoImpl _bloc = ProfileRepoImpl.instance;

  var delta = 0;

  Map _source = {ConnectivityResult.none: false};

  AppConnectivity _connectivity = AppConnectivity.instance;

  bool isConnected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _connectivity.initialise();
    _connectivity.connectStream.listen((source) {
      setState(() => _source = source);
    });
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isConnected = checkConnected();

    final height = MediaQuery
        .of(context)
        .size
        .height;

    return Container(
        margin: EdgeInsets.only(top: height / 10),
        child: isConnected
            ? StreamBuilder<Profile>(
          stream: _bloc.profileStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.error != null) {
              return Center(
                  child: Text("An error occurred, please try again!"));
            } else {
              return GestureDetector(
                onPanUpdate: (details) {
                  delta = details.delta.dx > 0
                      ? 1
                      : -1; // Get position when user swip right or left
                },
                onPanEnd: (details) {
                  delta > 0
                      ? _saveFavorite(snapshot.data)
                      : _callBloc(); // Call save to Favorite when user swiper to Right and call new User when user swiper Left
                },
                child: ProfileItem(profile: snapshot.data),
              );
            }
          },
        ) : Center(child: Text("Network disconnected"))
    );
  }

  void _callBloc() {
    _bloc.getProfileByLocation(BASE_URL);
  }

  void _saveFavorite(Profile profile) {
    _bloc.saveProfile(profile);
  }

  bool checkConnected() {
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.none:
        {
          return false;
        }
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        {
          _callBloc();
          return true;
        }
    }
    return true;
  }
}

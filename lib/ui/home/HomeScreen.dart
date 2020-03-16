import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pyco/data/ProfileRepoImpl.dart';
import 'package:flutter_app_pyco/inherited/ProfileInherited.dart';
import 'package:flutter_app_pyco/model/Profile.dart';
import 'package:flutter_app_pyco/ui/favorite/FavoriteScreen.dart';
import 'package:flutter_app_pyco/ui/profile/ProfileScreen.dart';
import 'package:flutter_app_pyco/utils/AppConnectivity.dart';
import 'package:flutter_app_pyco/utils/NetworkUtil.dart';

class HomeScreen extends StatefulWidget {
  // MARK: - VARIABLE
  static const routerName = "/home"; // Create router for home page

  // MARK: LIFE CYCLE
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // MARK: - VARIABLE
  final List<Widget> _pages = <Widget>[
    ProfileScreen(),
    FavoriteScreen()
  ]; // Create list navigationbar

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
        title: Text("Profile"), icon: Icon(Icons.perm_identity)),
    BottomNavigationBarItem(title: Text("Favorite"), icon: Icon(Icons.favorite))
  ]; // Create list navigationbar item

  final PageStorageBucket _bucket =
  PageStorageBucket(); // Create PageStorageBucket save state Page on NavigationBar when change Tab

  int _selectedIndex = 0; // Create variable save index tabbar

  Map _source = {ConnectivityResult.none: false};

  AppConnectivity _connectivity = AppConnectivity
      .instance; // Create app provider check Connnection

  bool isConnected = false; // Check connection netwwork

  var delta = 0; // Create variable delta use Get to know the user swiping left or right

  ProfileRepoImpl _bloc = ProfileRepoImpl.instance;

  // MARK: LIFE CYCLE

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _connectivity.initialise();
    _connectivity.connectStream.listen((source) {
      setState(() => _source = source);
    });
    _callBloc();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isConnected = checkConnected();

    return Scaffold(
        bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
        body: PageStorage(bucket: _bucket, child: StreamBuilder<Profile>(
          stream: _bloc.profileStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.error != null) {
              return _checkTabNavigator("An error occurred, please try again!");
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
                child: ProfileInherited(
                    profile: snapshot.data,
                    child: isConnected
                        ? IndexedStack(children: _pages, index: _selectedIndex)
                        : _checkTabNavigator("Network dissconnect")),
              );
            }
          },
        )));
  }

  // MARK: - FUNCTION
  // Create func setup Bottom NavigationBar
  Widget _bottomNavigationBar(int selectedIndex) =>
      BottomNavigationBar(
          onTap: (int index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          items: _items);

  // Create func use setState Widget when change network or error
  Widget _checkTabNavigator(String title) =>
      _selectedIndex == 0 ? Center(child: Text(title)) : FavoriteScreen();

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
          return true;
        }
    }
    return true;
  }
}

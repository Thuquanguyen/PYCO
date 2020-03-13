import 'package:flutter/material.dart';
import 'package:flutter_app_pyco/bloc/BlocProvider.dart';
import 'package:flutter_app_pyco/data/ProfileRepoImpl.dart';
import 'package:flutter_app_pyco/inherited/ProfileInherited.dart';
import 'package:flutter_app_pyco/model/Profile.dart';
import 'package:flutter_app_pyco/ui/favorite/FavoriteScreen.dart';
import 'package:flutter_app_pyco/ui/profile/ProfileScreen.dart';
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
  final List<Widget> _pages = [
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

  ProfileRepoImpl bloc;

  var delta = 0;

  // MARK: LIFE CYCLE
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<ProfileRepoImpl>(context);
    _callBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: StreamBuilder<Profile>(
        stream: bloc.profileStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return Center(child: Text("An error occurred, please try again!"));
          } else {
            return PageStorage(
                bucket: _bucket,
                child: ProfileInherited(
                    profile: snapshot.data,
                    child: GestureDetector(
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
                      child: _pages[_selectedIndex],
                    )));
          }
        },
      ),
    );
  }

  // MARK: - FUNCTION
  // Create func setup Bottom NavigationBar
  Widget _bottomNavigationBar(int selectedIndex) =>
      BottomNavigationBar(
          onTap: (int index) => setState(() => _selectedIndex = index),
          currentIndex: selectedIndex,
          items: _items);

  // Create func call API with URL
  void _callBloc() {
    bloc.getProfileByLocation(BASE_URL);
  }

  // Create func save user to favorite
  void _saveFavorite(Profile profile) {
    bloc.saveProfile(profile);
  }
}

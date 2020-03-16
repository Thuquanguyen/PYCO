import 'package:flutter/material.dart';
import 'package:flutter_app_pyco/ui/favorite/FavoriteScreen.dart';
import 'package:flutter_app_pyco/ui/profile/ProfileScreen.dart';


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

  // MARK: LIFE CYCLE

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
        body: PageStorage(
          bucket: _bucket,
          child: _pages[_selectedIndex],
        ));
  }

  // MARK: - FUNCTION
  // Create func setup Bottom NavigationBar
  Widget _bottomNavigationBar(int selectedIndex) =>
      BottomNavigationBar(
          onTap: (int index) => setState(() => _selectedIndex = index),
          currentIndex: selectedIndex,
          items: _items);

  // Create func use setState Widget when change network or error
  Widget _checkTabNavigator(String title) =>
      _selectedIndex == 0 ? Center(child: Text(title)) : FavoriteScreen();
}

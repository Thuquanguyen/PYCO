import 'package:flutter/material.dart';
import 'package:flutter_app_pyco/bloc/BlocProvider.dart';
import 'package:flutter_app_pyco/data/ProfileRepoImpl.dart';
import 'package:flutter_app_pyco/model/Profile.dart';
import 'package:flutter_app_pyco/ui/FavoriteItem.dart';

class FavoriteScreen extends StatefulWidget {
  // MARK: - VARIABLE
  static const routerName = "/favorite";

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // MARK: - VARIABLE
  ProfileRepoImpl bloc;

  // MARK: LIFE CYCLE
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BlocProvider.of<ProfileRepoImpl>(context);
    bloc.getProfilesFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Profile>>(
      stream: bloc.favoriteStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return Center(child: Text("An error occurred, please try again!"));
        } else {
          return snapshot.data.length == 0 ? Center(
              child: Text("Data not available!")) : ListView.builder(
              itemBuilder: (context, index) {
                return FavoriteItem(profile: snapshot.data[index]);
              }, itemCount: snapshot.data.length);
        }
      },
    );
  }
}

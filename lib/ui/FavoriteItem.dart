import 'package:flutter/material.dart';
import 'package:flutter_app_pyco/model/Profile.dart';

class FavoriteItem extends StatelessWidget {
  // MARK: - VARIABLE
  final Profile profile;

  FavoriteItem({@required this.profile});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return Container(
      child: ListTile(
        title: Text(profile.first),
        subtitle: Text(profile.email),
        leading: AspectRatio(aspectRatio: 1, child: FadeInImage.assetNetwork(
          placeholder: 'assets/images/image_none.jpg',
          image: profile.picture,
        )),
        trailing: IconButton(
            icon: Icon(Icons.favorite, color: Colors.red), onPressed: null),
      ),
    );
  }
}

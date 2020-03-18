import 'package:flutter/material.dart';
import 'package:flutter_app_pyco/model/Profile.dart';

class FavoriteItem extends StatelessWidget {
  // MARK: - VARIABLE
  final Profile profile;

  FavoriteItem({@required this.profile});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListTile(
        title: Text(profile.first),
        subtitle: Text(profile.email),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(MediaQuery
              .of(context)
              .size
              .width / 2),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/image_none.jpg',
            image: profile.large,
          ),
        ),
        trailing: IconButton(
            icon: Icon(Icons.favorite, color: Colors.red), onPressed: null),
      ),
    );
  }
}

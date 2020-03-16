import 'package:flutter/material.dart';
import 'package:flutter_app_pyco/model/ItemBar.dart';
import 'package:flutter_app_pyco/model/Profile.dart';

class ProfileItem extends StatefulWidget {
  final Profile profile;

  ProfileItem({@required this.profile});

  @override
  _ProfileItemState createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {

  List<ItemBar> items = [
    ItemBar(isActive: true, iconData: Icons.person_outline),
    ItemBar(isActive: false, iconData: Icons.mail_outline),
    ItemBar(isActive: false, iconData: Icons.map),
    ItemBar(isActive: false, iconData: Icons.phone),
    ItemBar(isActive: false, iconData: Icons.lock_outline),
  ];

  var listTitle = [
    "My Name is",
    "My Email is",
    "My Address is",
    "My Phone is",
    "My UserName is"
  ];

  var indexTitle = 0;

  @override
  Widget build(BuildContext context) {
    var listContent = [
      "${widget.profile.title} ${widget.profile.first} ${widget.profile.last}",
      "${widget.profile.email}",
      "${widget.profile.street},${widget.profile.city}",
      "${widget.profile.phone}",
      "${widget.profile.username}"
    ];

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Card(
        margin: EdgeInsets.all(20),
        child: Container(
            height: height / 1.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(width: width),
                _setupImage(width, height),
                SizedBox(height: 20),
                Text(listTitle[indexTitle],
                    style: TextStyle(color: Colors.black26, fontSize: 20)),
                SizedBox(height: 10),
                Text(listContent[indexTitle],
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    textAlign: TextAlign.center),
                Flexible(
                    child: _setupBottomBar())
              ],
            )));
  }

  Widget _setupImage(double width, double height) =>
      Stack(
        children: <Widget>[
          Container(
              height: height / 5.5,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.tealAccent, width: 1.0)))),
          Align(
            alignment: Alignment.center,
            child: Container(
                margin: EdgeInsets.only(top: 20),
                width: width / 2.5,
                height: width / 2.5,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            widget.profile.picture)))),
          )
        ],
      );

  Widget _setupBottomBar() =>
      Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: GridView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                child: ListTile(
                  title: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 2,
                      color: setColor(index, Colors.white)),
                  subtitle: Icon(items[index].iconData,
                      color: setColor(index, Colors.black26)),
                ),
                onTap: () =>
                    setState(() {
                      updateListItem();
                      items[index].isActive = true;
                      indexTitle = index;
                    }),
              );
            },
            itemCount: items.length,
            shrinkWrap: true,
            primary: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: items.length)),
      );

  updateListItem() {
    for (var item in items) {
      item.isActive = false;
    }
  }

  setColor(int index, Color color) {
    return items[index].isActive ? Colors.red : color;
  }
}

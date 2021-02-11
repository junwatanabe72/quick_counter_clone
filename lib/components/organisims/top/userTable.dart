import 'package:flutter/material.dart';
import 'package:quick_counter_clone/models/user.dart';
import 'package:quick_counter_clone/services/http/index.dart';
import 'package:quick_counter_clone/util/hook/changeIntegerToString.dart';
import "package:quick_counter_clone/util/hook/map.dart";

class UserTable extends StatefulWidget {
  final String mode;
  UserTable({this.mode});
  @override
  _UserTableState createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  Future<List<User>> _gameTextList;
  @override
  void initState() {
    super.initState();
    _gameTextList = getUsers(widget.mode);
  }

  @override
  Widget build(BuildContext context) {
    print("test");
    return FutureBuilder(
        future: _gameTextList,
        builder: (context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Text("");
            }
            return Column(children: [
              ...snapshot.data.indexedMap((index, user) => Align(
                  alignment: Alignment.topLeft,
                  child: switchMode(user, widget.mode, index)))
            ]);
          } else {
            return Text("");
          }
        });
  }

  Widget switchMode(User user, String mode, int index) {
    switch (mode) {
      case "1-30":
        return Text(
            "${index + 1}.${user.name}: ${changeIntegerToString(user.first)}s",
            style: TextStyle(
              height: 1.0,
            ));
        break;
      case "A-Z":
        return Text(
            "${index + 1}.${user.name}: ${changeIntegerToString(user.second)}s",
            style: TextStyle(
              height: 1.0,
            ));

        break;
      default:
        return Text(
            "${index + 1}.${user.name}: ${changeIntegerToString(user.third)}s",
            style: TextStyle(
              height: 1.0,
            ));
        break;
    }
  }
}

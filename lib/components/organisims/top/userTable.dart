import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/models/user.dart';
// import 'package:quick_counter_clone/services/http/index.dart';
import 'package:quick_counter_clone/stores/user.dart';
import 'package:quick_counter_clone/util/hook/changeIntegerToString.dart';
import "package:quick_counter_clone/util/hook/map.dart";

class UserTable extends StatelessWidget {
  final Future<List<dynamic>> users;
  final String mode;
  UserTable({this.users, this.mode});

  @override
  Widget build(BuildContext context) {
    print(this.users);

    // return Text("te");
    // return Selector<UserStore, List<User>>(
    //     selector: (context, userStore) =>
    //         userStore.globalUsers == null ? [] : userStore.globalUsers,
    // builder: (context, users, child) =>
    return Column(children: [
      // this.users.then((value) => return Text(value.toString()))
      // ...this.users.indexedMap((index, user) => Align(
      //     alignment: Alignment.topLeft,
      //     child: switchMode(user, this.mode, index)))
    ]);
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

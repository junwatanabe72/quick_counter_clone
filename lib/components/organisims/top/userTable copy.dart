import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/models/user.dart';
// import 'package:quick_counter_clone/services/http/index.dart';
import 'package:quick_counter_clone/stores/user.dart';
import 'package:quick_counter_clone/util/hook/changeIntegerToString.dart';
import "package:quick_counter_clone/util/hook/map.dart";

class UserTable extends StatelessWidget {
  // final Future<List<dynamic>> users;
  final Stream<List<User>> users;
  final String mode;
  UserTable({this.users, this.mode});

  @override
  Widget build(BuildContext context) {
    print(this.users);
    return StreamBuilder(
        stream: this.users,
        builder: (context, AsyncSnapshot<List<User>> snapShot) {
          if (!snapShot.hasData) {
            return CircularProgressIndicator();
          } else {
            print(snapShot.data);
            return ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                    height: 100,
                    width: 150,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: switchMode(snapShot.data[0], this.mode),
                    ))
                // switchMode(snapShot.data[1], this.mode),
              ],
            );

            // snapShot.data.map((user) => Align(
            //     alignment: Alignment.topLeft,
            //     child: switchMode(user, this.mode))));
          }
        });
  }

  Widget switchMode(User user, String mode) {
    print("gggg");
    final index = 1;
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
  // Widget switchMode(User user, String mode, int index) {
  //   switch (mode) {
  //     case "1-30":
  //       return Text(
  //           "${index + 1}.${user.name}: ${changeIntegerToString(user.first)}s",
  //           style: TextStyle(
  //             height: 1.0,
  //           ));
  //       break;
  //     case "A-Z":
  //       return Text(
  //           "${index + 1}.${user.name}: ${changeIntegerToString(user.second)}s",
  //           style: TextStyle(
  //             height: 1.0,
  //           ));

  //       break;
  //     default:
  //       return Text(
  //           "${index + 1}.${user.name}: ${changeIntegerToString(user.third)}s",
  //           style: TextStyle(
  //             height: 1.0,
  //           ));
  //       break;
  //   }
  // }
}

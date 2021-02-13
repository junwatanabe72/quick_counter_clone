import 'package:flutter/material.dart';
import 'package:quick_counter_clone/models/user.dart';
import 'package:quick_counter_clone/util/hook/changeIntegerToString.dart';

class UserTable extends StatelessWidget {
  final Stream<List<User>> users;
  final String mode;
  UserTable({this.users, this.mode});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: this.users,
        builder: (context, AsyncSnapshot<List<User>> snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapShot.data.length == 0) {
            return Text("");
          }
          final maxLength =
              snapShot.data.length > 10 ? 10 : snapShot.data.length - 1;
          final numbersList = new List.generate(maxLength, (i) => i);
          return ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ...numbersList.map((int num) {
                if (snapShot.data.length < num) {
                  return Text("");
                }
                return Container(
                    width: 150,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: switchMode(snapShot.data[num], this.mode, num),
                    ));
              })
            ],
          );
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

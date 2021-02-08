import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renda_clone/models/user.dart';
import 'package:renda_clone/stores/user.dart';
import 'package:renda_clone/util/hook/map.dart';
import 'package:renda_clone/stores/game.dart';

class UserTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mode = Provider.of<GameStore>(context).game.mode;
    return Selector<UserStore, List<User>>(
        selector: (context, userStore) => userStore.sortUsers(_mode),
        builder: (context, users, child) => Column(children: [
              ...users.indexedMap((index, user) => Align(
                  alignment: Alignment.topLeft,
                  child: switchMode(user, _mode, index)))
            ]));
  }

  Widget switchMode(User user, String mode, int index) {
    switch (mode) {
      case "10S":
        return Text("${index + 1}.${user.name}: ${user.first.toString()}s",
            style: TextStyle(
              height: 1.0,
            ));
        break;
      case "60S":
        return Text("${index + 1}.${user.name}: ${user.second.toString()}s",
            style: TextStyle(
              height: 1.0,
            ));

        break;
      default:
        return Text("${index + 1}.${user.name}: ${user.third.toString()}s",
            style: TextStyle(
              height: 1.0,
            ));
        break;
    }
  }
}

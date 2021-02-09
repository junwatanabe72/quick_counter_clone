import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/models/user.dart';
import 'package:quick_counter_clone/stores/user.dart';
import 'package:quick_counter_clone/util/hook/changeIntegerToString.dart';
import 'package:quick_counter_clone/util/hook/map.dart';
import 'package:quick_counter_clone/util/hook/sortUser.dart';
import 'package:quick_counter_clone/stores/game.dart';

class UserTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mode = context.watch<GameStore>().game.mode;
    return Selector<UserStore, List<User>>(
        selector: (context, userStore) => sortUsers(userStore.users, _mode),
        builder: (context, users, child) => Column(children: [
              ...users.indexedMap((index, user) => Align(
                  alignment: Alignment.topLeft,
                  child: switchMode(user, _mode, index)))
            ]));
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

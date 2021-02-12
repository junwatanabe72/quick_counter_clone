import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/components/organisims/top/userTable.dart';
import 'package:quick_counter_clone/models/user.dart';
import 'package:quick_counter_clone/stores/game.dart';

const title = "Leaderboard";

class Board extends StatelessWidget {
  // final Future<List<dynamic>> users;
  final Stream<List<User>> users;
  Board({this.users});
  @override
  Widget build(BuildContext context) {
    final _mode = context.watch<GameStore>().game.mode;
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.red.withOpacity(0.5),
            width: 2.0,
          )),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(title,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20,
              height: 1.0,
            )),
        UserTable(users: this.users, mode: _mode),
      ]),
    );
  }
}

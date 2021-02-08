import 'package:flutter/material.dart';
import 'package:renda_clone/components/organisims/top/userTable.dart';

const title = "Leaderboard";

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        UserTable(),
      ]),
    );
  }
}

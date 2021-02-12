import 'package:flutter/material.dart';
import 'package:quick_counter_clone/components/organisims/top/board.dart';
import 'package:quick_counter_clone/components/organisims/top/roll.dart';
import 'package:quick_counter_clone/models/user.dart';

// StatelessWidgetを継承
class Footer extends StatelessWidget {
  final double width;
  final double height;
  final Stream<List<User>> users;
  Footer({this.users, this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Roll(),
            Container(
                width: width / 2,
                child: Column(children: [
                  ConstrainedBox(
                      constraints: BoxConstraints(minHeight: this.height * 0.9),
                      child: Board(users: this.users)),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Text("2021.1.1",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 10)))
                ]))
          ],
        ));
  }
}

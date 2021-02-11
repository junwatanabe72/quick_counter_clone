import 'package:flutter/material.dart';
// import 'package:quick_counter_clone/models/user.dart';
// import 'package:quick_counter_clone/services/http/index.dart';

class AppTitle extends StatelessWidget {
  final List<String> title;
  final double height;
  final double width;
  AppTitle({@required this.title, @required this.width, @required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.height,
        width: this.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ...title
              .map((value) => Text(value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                    letterSpacing: 3.0,
                    fontSize: 40,
                  )))
              .toList()
        ]));
  }
}

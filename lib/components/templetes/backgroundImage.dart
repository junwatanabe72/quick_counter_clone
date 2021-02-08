import 'package:flutter/material.dart';

// StatelessWidgetを継承
class BackgroundImage extends StatelessWidget {
  final Widget bodyWidget;
  BackgroundImage({this.bodyWidget});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/universe.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: bodyWidget);
  }
}

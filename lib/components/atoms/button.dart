import 'package:flutter/material.dart';
import 'package:quick_counter_clone/util/hook/soundPool.dart';

class Button extends StatelessWidget {
  final String text;
  final bool selected;
  final double width;
  final double height;
  final Function onTap;
  final Color color;
  final Color fontColor;
  Button(
      {this.text = "",
      this.fontColor = Colors.white,
      this.color = Colors.red,
      @required this.onTap,
      @required this.selected,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        SoundPool.hitSound();
        this.onTap();
      },
      child: Container(
          width: this.width,
          height: this.height,
          decoration: BoxDecoration(
              color: selected
                  ? this.color.withOpacity(0.3)
                  : this.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: selected
                    ? this.color.withOpacity(0.5)
                    : this.color.withOpacity(0.1),
                width: 2.0,
              )),
          child: Center(
              child: Text(this.text,
                  style: TextStyle(
                    fontSize: 20,
                    color: this.fontColor,
                  )))),
    );
  }
}

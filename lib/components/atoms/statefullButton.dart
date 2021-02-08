import 'package:flutter/material.dart';
import 'package:renda_clone/util/hook/soundPool.dart';

class StatefullButton extends StatefulWidget {
  final String text;
  final double width;
  final Function onTap;
  StatefullButton({this.text = "", @required this.onTap, this.width});

  @override
  _StatefullButtonState createState() => _StatefullButtonState();
}

class _StatefullButtonState extends State<StatefullButton> {
  bool _active = true;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          SoundPool.hitSound();
          widget.onTap();
        },
        onTapUp: (TapUpDetails tapUpDetails) => {_handleTap()},
        onTapDown: (TapDownDetails tapDownDetails) => {_handleTap()},
        child: Container(
            width: widget.width,
            decoration: BoxDecoration(
                color: _active
                    ? Colors.red.withOpacity(0.2)
                    : Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: _active
                      ? Colors.red.withOpacity(0.5)
                      : Colors.red.withOpacity(0.1),
                  width: 2.0,
                )),
            child: Center(
                child: Text(widget.text,
                    style: TextStyle(
                      fontSize: 20,
                    )))));
  }
}

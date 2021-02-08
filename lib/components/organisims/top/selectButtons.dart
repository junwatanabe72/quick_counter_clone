import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renda_clone/components/atoms/Button.dart';
import 'package:renda_clone/stores/game.dart';
import 'package:renda_clone/util/var/index.dart';

class SelectButtons extends StatelessWidget {
  final Function changeGameMode;
  final double height;
  final double width;
  SelectButtons({this.changeGameMode, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    final _mode = context.select((GameStore store) => store.game.mode);
    return Container(
      height: this.height,
      width: this.width,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: gameModes.keys
              .map((key) => Button(
                  text: gameModes[key],
                  selected: gameModes[key] == _mode,
                  onTap: () => {this.changeGameMode(key)},
                  width: this.width / 3.2))
              .toList()),
    );
  }
}

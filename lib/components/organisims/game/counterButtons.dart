import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/components/atoms/Button.dart';
import 'package:quick_counter_clone/stores/game.dart';
import 'package:quick_counter_clone/stores/timer.dart';

const coefficient = 5.7;

class CounterButtons extends StatelessWidget {
  final List<String> list;
  final double height;
  final double width;
  final bool inPlay;
  final bool isClear;
  CounterButtons(
      {this.list, this.isClear, this.inPlay, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    final onTap = (String value) {
      if (context.read<GameStore>().game.inPlay) {
        context.read<GameStore>().checkSelectedText(value);
        context
            .read<TimerStore>()
            .endTimer(context.read<GameStore>().game.inPlay);
      }
    };

    return Container(
      height: this.height,
      width: this.width,
      child: Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          alignment: WrapAlignment.center,
          children: this
              .list
              .map(
                (String value) => Button(
                  text: value,
                  selected: [inPlay, isClear].contains(true),
                  onTap: () => onTap(value),
                  height: this.height / coefficient,
                  width: this.width / coefficient,
                ),
              )
              .toList()),
    );
  }
}

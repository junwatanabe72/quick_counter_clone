import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/components/atoms/Button.dart';
import 'package:quick_counter_clone/stores/game.dart';
import 'package:quick_counter_clone/stores/timer.dart';

const coefficient = 6.2;

class CounterButtons extends StatelessWidget {
  final List<String> list;
  final double height;
  final double width;
  CounterButtons({this.list, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    final _inPlay = context.select((GameStore store) => store.game.inPlay);
    final onTap = (String value) => {
          context.read<GameStore>().checkSelectedText(value),
          context.read<TimerStore>().endTimer(_inPlay),
        };
    print("dd");
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
                  selected: true,
                  onTap: () => onTap(value),
                  height: this.height / coefficient,
                  width: this.width / coefficient,
                ),
              )
              .toList()),
    );
  }
}

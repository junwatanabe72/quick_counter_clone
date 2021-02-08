import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/components/atoms/Button.dart';
import 'package:quick_counter_clone/stores/game.dart';
import 'package:quick_counter_clone/stores/timer.dart';

const length = 16;
const fill = "";

class CounterButtons extends StatelessWidget {
  final double height;
  final double width;
  CounterButtons({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    final _timer = context.watch<TimerStore>();
    final _gameTime = context.watch<GameStore>().game.time;
    final _inPlay = context.select((GameStore store) => store.game.inPlay);
    final onTap = () => {
          if (_inPlay)
            {context.read<GameStore>().incrementCount()}
          else
            {
              context.read<GameStore>().inPlayToggle(),
              _timer.startTimer(_gameTime)
            }
        };

    return Container(
      height: this.height,
      width: this.width,
      child: Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          alignment: WrapAlignment.center,
          children: List<String>.filled(length, fill, growable: true)
              .map(
                (key) => Button(
                  text: "",
                  selected: true,
                  onTap: onTap,
                  height: this.height / 4.3,
                  width: this.width / 4.3,
                ),
              )
              .toList()),
    );
  }
}

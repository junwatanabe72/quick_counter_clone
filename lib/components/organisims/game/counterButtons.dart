import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:quick_counter_clone/components/atoms/Button.dart';
import 'package:quick_counter_clone/stores/game.dart';
import 'package:quick_counter_clone/stores/timer.dart';
import 'package:quick_counter_clone/util/hook/gameModeList.dart';

const length = 30;
const fill = "";
const coefficient = 6.2;

class CounterButtons extends StatelessWidget {
  final double height;
  final double width;
  CounterButtons({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    final _timer = context.watch<TimerStore>();
    final _gameMode = context.watch<GameStore>().game.mode;
    final _inPlay = context.select((GameStore store) => store.game.inPlay);
    final onTap = () => {
          if (_inPlay)
            {context.read<GameStore>().incrementCount()}
          else
            {
              context.read<GameStore>().inPlayToggle(),
              // _timer.startTimer(_gameTime)
            }
        };

    final textList = {
      "1-30": numbersList,
      "a-z": lowerAlperbelList,
      "A-Z": upperAlperbelList
    };

    return Container(
      height: this.height,
      width: this.width,
      child: Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          alignment: WrapAlignment.center,
          children: shuffleList(textList[_gameMode])
              .map(
                (key) => Button(
                  text: key,
                  selected: true,
                  onTap: onTap,
                  height: this.height / coefficient,
                  width: this.width / coefficient,
                ),
              )
              .toList()),
    );
  }
}

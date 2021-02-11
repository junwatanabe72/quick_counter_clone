import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/components/atoms/statefullButton.dart';
import 'package:quick_counter_clone/components/organisims/top/selectButtons.dart';
import 'package:quick_counter_clone/pages/game.dart';
import 'package:quick_counter_clone/stores/game.dart';
import 'package:quick_counter_clone/stores/timer.dart';

class TopPageButtons extends StatelessWidget {
  final Function changeGameMode;
  final Function function;
  final double height;
  final double width;
  TopPageButtons(
      {@required this.changeGameMode,
      this.function,
      @required this.height,
      @required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SelectButtons(
          function: this.function,
          changeGameMode: this.changeGameMode,
          width: this.width,
          height: this.height),
      const Padding(padding: EdgeInsets.all(5)),
      Container(
          width: this.width,
          height: this.height,
          child: StatefullButton(
              soundPath: "assets/play.mp3",
              text: "PLAY!",
              onTap: () async {
                context.read<GameStore>().toggleInPlay();
                context.read<TimerStore>().startTimer();
                Navigator.of(context).pushNamed(Game.routeName);
              }))
    ]);
  }
}

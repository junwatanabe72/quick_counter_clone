import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/stores/game.dart';
import 'package:quick_counter_clone/util/var/index.dart';

const leadTextA = "Press any button";
const leadTextB = "to start";

class GameText extends StatelessWidget {
  final bool inPlay;
  GameText({@required this.inPlay});

  @override
  Widget build(BuildContext context) {
    final _gameMode = context.watch<GameStore>().game.mode;
    return Container(
        alignment: Alignment.center,
        child: inPlay
            ? Selector<GameStore, int>(
                selector: (context, game) => game.game.count,
                builder: (context, count, child) => Container(
                    alignment: Alignment.center,
                    child: Text(baseTextList[_gameMode][count],
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 40,
                        ))))
            : Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    const Text(leadTextA,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 40,
                          height: 1.0,
                        )),
                    const Text(leadTextB,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 40,
                          height: 1.0,
                        ))
                  ]));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/stores/game.dart';
import 'package:quick_counter_clone/util/var/index.dart';

const loseText = "GAME OVER";
const winText = "CONGRATULATIONS";

class GameText extends StatelessWidget {
  final bool inPlay;
  final bool isClear;
  GameText({@required this.inPlay, @required this.isClear});

  @override
  Widget build(BuildContext context) {
    final _gameMode = context.watch<GameStore>().game.mode;
    final _gameText = this.isClear ? winText : loseText;
    return Container(
        alignment: Alignment.center,
        child: this.inPlay
            ? Selector<GameStore, int>(
                selector: (context, game) => game.game.count,
                builder: (context, count, child) => Container(
                    alignment: Alignment.center,
                    child: Text(baseTextList[_gameMode][count],
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 40,
                        ))))
            : Text(_gameText,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 36,
                  height: 1.0,
                )));
  }
}

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/components/atoms/space.dart';
import 'package:quick_counter_clone/components/organisims/game/gameText.dart';
import 'package:quick_counter_clone/components/organisims/game/counterButtons.dart';
import 'package:quick_counter_clone/components/templetes/backgroundImage.dart';
import 'package:quick_counter_clone/stores/game.dart';
import 'package:quick_counter_clone/stores/timer.dart';
import "../components/templetes/header/game.dart";

class Game extends StatelessWidget {
  static const routeName = "/game";
  @override
  Widget build(BuildContext context) {
    final _inPlay = context.select((GameStore store) => store.game.inPlay);
    final _isClear = context.select((GameStore store) => store.game.isClear);
    final _gameMode = context.watch<GameStore>().game.mode;
    final _timerUp = context.select((TimerStore store) => store.timeUp);
    final _size = MediaQuery.of(context).size;
    final _padding = MediaQuery.of(context).padding;
    var maxHeight = _size.height - _padding.top - _padding.bottom;

    // アプリ描画エリアの縦サイズを取得
    if (Platform.isAndroid) {
      maxHeight = _size.height - _padding.top - kToolbarHeight;
    } else if (Platform.isIOS) {
      maxHeight = _size.height - _padding.top - _padding.bottom - 22;
    }

    // heightSize
    final headerHeight = maxHeight * (10 / 100);
    final textHeight = maxHeight * (16 / 100);
    final buttonsHeight = maxHeight * (68 / 100);
    final comHeight = maxHeight * (8 / 100);

    final gameWidth = _size.width / 1.05;
    final buttonWidth = _size.width / 1.00;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackgroundImage(
          bodyWidget: Column(children: [
            Header(
                height: headerHeight,
                width: gameWidth,
                inPlay: _inPlay,
                timeUp: _timerUp),
            Container(
                height: textHeight,
                alignment: Alignment.bottomCenter,
                child: GameText(inPlay: _inPlay, isClear: _isClear)),
            CounterButtons(
                inPlay: _inPlay,
                gameMode: _gameMode,
                isClear: _isClear,
                width: buttonWidth,
                height: buttonsHeight),
            Space(
              height: comHeight,
            )
          ]),
        ));
  }
}

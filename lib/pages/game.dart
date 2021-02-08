import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:renda_clone/components/atoms/space.dart';
import 'package:renda_clone/components/organisims/game/gameText.dart';
import 'package:renda_clone/components/organisims/game/counterButtons.dart';
import 'package:renda_clone/components/templetes/backgroundImage.dart';
import 'package:renda_clone/stores/game.dart';
import 'package:renda_clone/stores/timer.dart';
import 'package:renda_clone/stores/user.dart';
import "../components/templetes/header/game.dart";

class Game extends StatelessWidget {
  static const routeName = "/game";
  @override
  Widget build(BuildContext context) {
    Provider.of<UserStore>(context);
    final _inPlay = context.select((GameStore store) => store.game.inPlay);
    final _timerUp = context.select((TimerStore store) => store.timeUp);
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    var maxHeight = size.height - padding.top - padding.bottom;

    // アプリ描画エリアの縦サイズを取得
    if (Platform.isAndroid) {
      maxHeight = size.height - padding.top - kToolbarHeight;
    } else if (Platform.isIOS) {
      maxHeight = size.height - padding.top - padding.bottom - 22;
    }

    // heightSize
    final headerHeight = maxHeight * (10 / 100);
    final textHeight = maxHeight * (16 / 100);
    final buttonsHeight = maxHeight * (68 / 100);
    final comHeight = maxHeight * (8 / 100);

    final gameWidth = size.width / 1.05;

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
                child: GameText(inPlay: _inPlay)),
            _timerUp
                ? const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("Time`s Up!",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 40,
                          height: 1.0,
                        )))
                : CounterButtons(width: gameWidth, height: buttonsHeight),
            Space(
              height: comHeight,
            )
          ]),
        ));
  }
}

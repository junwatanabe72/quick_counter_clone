import 'package:flutter/material.dart';
import 'package:quick_counter_clone/models/game.dart';
import 'package:quick_counter_clone/util/var/index.dart';

class GameStore extends ChangeNotifier {
  Game _game = Game(
      mode: gameModes[mode.first.toString()],
      time: gameTimes[mode.first.toString()],
      isClear: false,
      inPlay: false,
      count: 0);
  Game get game => _game;

  changeGameMode(String key) {
    if (game.mode == gameModes[key]) {
      return;
    }
    _game.mode = gameModes[key];
    _game.time = gameTimes[key];
    notifyListeners();
  }

  incrementCount() async {
    _game.count += 1;
    notifyListeners();
  }

  checkSelectedText(String value) {
    final currentText = baseTextList[_game.mode];
    final baseEndPoint = currentText.length - 1;
    final testMode = test ? testEndPoint : baseEndPoint;

    if (currentText[_game.count] != value) {
      toggleInPlay();
    }
    if (currentText[_game.count] == currentText[testMode]) {
      toggleInPlay();
      toggleIsClear();
    }
    incrementCount();
  }

  gameEnd() => {
        if (_game.inPlay) {toggleInPlay()},
        if (_game.isClear) {toggleIsClear()},
        _game.count = 0,
        notifyListeners(),
      };

  toggleInPlay() => {
        _game.inPlay = !_game.inPlay,
        notifyListeners(),
      };

  toggleIsClear() => {
        _game.isClear = !_game.isClear,
        notifyListeners(),
      };

  @override
  void dispose() {
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/components/atoms/Button.dart';
import 'package:quick_counter_clone/stores/game.dart';
import 'package:quick_counter_clone/stores/timer.dart';
import 'package:quick_counter_clone/util/var/index.dart';
import 'package:quick_counter_clone/util/hook/gameModeList.dart';

const widthCoefficient = 5.8;
const heightCoefficient = 6.5;

class CounterButtons extends StatefulWidget {
  final double height;
  final double width;
  final String gameMode;
  final bool inPlay;
  final bool isClear;
  CounterButtons(
      {@required this.isClear,
      @required this.inPlay,
      @required this.gameMode,
      this.height,
      this.width});
  @override
  _CounterButtonsState createState() => _CounterButtonsState();
}

class _CounterButtonsState extends State<CounterButtons> {
  List<String> _gameTextList;
  @override
  void initState() {
    super.initState();
    setState(() {
      _gameTextList = shuffleList(baseTextList[widget.gameMode]);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _onTap = (String value) {
      if (context.read<GameStore>().game.inPlay) {
        context.read<GameStore>().checkSelectedText(value);
        context
            .read<TimerStore>()
            .endTimer(context.read<GameStore>().game.inPlay);
      }
    };

    return Container(
      height: widget.height,
      width: widget.width,
      child: Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          alignment: WrapAlignment.center,
          children: _gameTextList
              .map(
                (String value) => Button(
                  text: value,
                  selected: [widget.inPlay, widget.isClear].contains(true),
                  onTap: () => _onTap(value),
                  height: widget.height / heightCoefficient,
                  width: widget.width / widthCoefficient,
                ),
              )
              .toList()),
    );
  }
}

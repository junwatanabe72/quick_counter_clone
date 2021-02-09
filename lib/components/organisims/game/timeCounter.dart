import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/stores/game.dart';
import 'package:quick_counter_clone/stores/timer.dart';
import 'package:quick_counter_clone/util/hook/changeIntegerToString.dart';

const leadTextA = "Press any button";
const leadTextB = "to start";

class TimeCounter extends StatelessWidget {
  final double width;

  TimeCounter({this.width});

  @override
  Widget build(BuildContext context) {
    final _mode = context.select((GameStore store) => store.game.mode);
    final _timeCount = context.select((TimerStore store) => store.timeCount);
    return Container(
        width: width / 2.1,
        child: Selector<TimerStore, String>(
            selector: (context, timer) => changeIntegerToString(_timeCount),
            builder: (context, count, child) => Container(
                alignment: Alignment.center,
                child: Text(count.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 40,
                    )))));
  }
}

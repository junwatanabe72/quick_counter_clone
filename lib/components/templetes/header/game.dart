import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/components/atoms/statefullButton.dart';
import 'package:quick_counter_clone/components/organisims/game/timeCounter.dart';
// import 'package:quick_counter_clone/models/user.dart';
// import 'package:quick_counter_clone/services/http/index.dart';
import 'package:quick_counter_clone/stores/timer.dart';
import 'package:quick_counter_clone/stores/game.dart';
import 'package:quick_counter_clone/stores/user.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  final double height;
  final double width;
  final bool inPlay;
  final bool timeUp;
  Header(
      {@required this.inPlay, @required this.timeUp, this.height, this.width});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final _mode = context.select((GameStore store) => store.game.mode);
    final _isClear = context.select((GameStore store) => store.game.isClear);
    final _timeCount = context.select((TimerStore store) => store.timeCount);
    return Container(
        width: this.width,
        height: this.height,
        padding: EdgeInsets.all(5),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TimeCounter(width: this.width),
          Container(
              width: width / 2.1,
              child: StatefullButton(
                text: "QUIT",
                onTap: () async {
                  context
                      .read<UserStore>()
                      .updateUserScore(_mode, _timeCount, _isClear);
                  context.read<GameStore>().gameEnd();
                  context.read<TimerStore>().resetCount();
                  Navigator.pop(context);
                },
              )),
        ]));
  }
}

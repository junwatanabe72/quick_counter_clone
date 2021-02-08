import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renda_clone/components/atoms/statefullButton.dart';
import 'package:renda_clone/components/organisims/game/timeCounter.dart';
import 'package:renda_clone/stores/timer.dart';
import 'package:renda_clone/stores/game.dart';
import 'package:renda_clone/stores/user.dart';

// StatelessWidgetを継承
class Header extends StatelessWidget with PreferredSizeWidget {
  final double height;
  final double width;
  final bool inPlay;
  final bool timeUp;
  Header({this.inPlay, this.timeUp, this.height, this.width});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  String getCountText(store) {
    List<String> base = ["0", "0", "0", "0"];
    String time = store.timeCount.toString();
    final list = time.split("");
    final reversdList = list.reversed.toList();
    reversdList.asMap().forEach((index, value) => base[index] = value);
    base.insert(2, ".");
    return base.reversed.join();
  }

  @override
  Widget build(BuildContext context) {
    final _count = context.select((GameStore store) => store.game.count);
    final _mode = context.select((GameStore store) => store.game.mode);
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
                onTap: () => {
                  context
                      .read<UserStore>()
                      .updateUserScore(_mode, _count, this.timeUp),
                  context.read<GameStore>().gameEnd(),
                  context.read<TimerStore>().resetCount(),
                  Navigator.pop(context)
                },
              )),
        ]));
  }
}

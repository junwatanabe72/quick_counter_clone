import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/components/atoms/Button.dart';
import 'package:quick_counter_clone/models/user.dart';
import 'package:quick_counter_clone/stores/game.dart';
import 'package:quick_counter_clone/stores/user.dart';
import 'package:quick_counter_clone/util/var/index.dart';

class SelectButtons extends StatelessWidget {
  final Function changeGameMode;
  final StreamSink<List<User>> sink;
  final double height;
  final double width;
  SelectButtons(
      {@required this.changeGameMode, this.sink, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    final _mode = context.select((GameStore store) => store.game.mode);
    return Container(
      height: this.height,
      width: this.width,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: gameModes.keys
              .map((key) => Button(
                  text: gameModes[key],
                  soundPath: "assets/hit.mp3",
                  selected: gameModes[key] == _mode,
                  onTap: () async {
                    this.changeGameMode(key);
                    final _backEndDBUsers = await context
                        .read<UserStore>()
                        .fetchBackEndDBlUsers(
                            context.read<GameStore>().game.mode);
                    this.sink.add(_backEndDBUsers);
                  },
                  width: this.width / 3.2))
              .toList()),
    );
  }
}

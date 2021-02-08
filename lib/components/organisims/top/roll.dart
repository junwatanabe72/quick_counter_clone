import 'package:flutter/material.dart';

class Roll extends StatelessWidget {
  final rollWidgets = [
    ["SOUND EFFECT:", "Hogehoge"],
    ["FONT:", "FugaLabo", "FugaProductions"],
    ["ICON:", "Hoge"],
    ["BACKGROUND:", "FlutterPublic"],
    ["SPECIAL THANKS:", "Hogefuga"],
    ["(c) 2021 HOGEHOGE"],
  ]
      .map((rolls) =>
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ...rolls
                .map((text) => Text(text,
                    style: TextStyle(
                      height: 1.0,
                    )))
                .toList(),
            const Padding(
              padding: EdgeInsets.all(5),
            )
          ]))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [...rollWidgets],
    );
  }
}

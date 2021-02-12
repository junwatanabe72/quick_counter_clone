import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:quick_counter_clone/components/atoms/space.dart';
import 'package:quick_counter_clone/components/organisims/top/title.dart';
import 'package:quick_counter_clone/components/organisims/top/topPageButton.dart';
import 'package:quick_counter_clone/components/organisims/top/userName.dart';
import 'package:quick_counter_clone/components/templetes/backgroundImage.dart';
import 'package:quick_counter_clone/components/templetes/footer/top.dart';
import 'package:quick_counter_clone/stores/game.dart';
import 'package:quick_counter_clone/stores/user.dart';
import "../components/templetes/header/top.dart";

class Top extends StatelessWidget {
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    final _user = context.select((UserStore store) => store.user);
    final _createUser = context.watch<UserStore>().createUser;
    final _changeGameMode = context.watch<GameStore>().changeGameMode;
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
    final headerHeight = maxHeight * (8 / 100);
    final titleHeight = maxHeight * (16 / 100);
    final userNameHeight = maxHeight * (5 / 100);
    final buttonHeight = maxHeight * (8 / 100);
    final hiddenButtonHeight = maxHeight * (16 / 100);
    final spaceHeight = maxHeight * (9 / 100);
    final footerHeight = maxHeight * (32 / 100);
    final comHeight = maxHeight * (8 / 100);
    final betweenNameAndButtonsHeight = maxHeight * (2 / 100);
    // widthSize
    final titleWidth = size.width / 2;
    final userNameWidth = size.width / 1.7;
    final buttonWidth = size.width / 1.1;
    final footerWidth = size.width / 1.05;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackgroundImage(
          bodyWidget: Column(children: [
            Header(
              height: headerHeight,
              width: buttonWidth,
            ),
            AppTitle(
              width: titleWidth,
              height: titleHeight,
              title: ["Quick", "Countre"],
            ),
            UserName(
              width: userNameWidth,
              height: userNameHeight,
              createUser: _createUser,
              name: _user != null ? _user.name : "",
            ),
            Space(
              height: betweenNameAndButtonsHeight,
            ),
            _user != null
                ? TopPageButtons(
                    changeGameMode: _changeGameMode,
                    width: buttonWidth,
                    height: buttonHeight,
                  )
                : Space(height: hiddenButtonHeight),
            Space(
              height: spaceHeight,
            ),
            Footer(
              width: footerWidth,
              height: footerHeight,
            ),
            Space(
              height: comHeight,
            )
          ]),
        ));
  }
}

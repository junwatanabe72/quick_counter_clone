import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renda_clone/stores/user.dart';

class Score extends StatelessWidget {
  final String mode;
  Score({@required this.mode});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(this.mode,
            style: TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.normal,
              fontSize: 20,
              height: 1.0,
            )),
        switchScore(this.mode),
      ],
    ));
  }

  Widget switchScore(String mode) {
    final scoreText = (number) => number == null ? "---" : number.toString();
    final textWidget = (int num) => Text(scoreText(num),
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20,
          height: 1.0,
        ));
    switch (mode) {
      case "10S":
        return Selector<UserStore, int>(
          selector: (context, userStore) => userStore.user?.first,
          builder: (context, user, child) => textWidget(user),
        );
        break;
      case "60S":
        return Selector<UserStore, int>(
          selector: (context, userStore) => userStore.user?.second,
          builder: (context, user, child) => textWidget(user),
        );
        break;
      default:
        return Selector<UserStore, int>(
          selector: (context, userStore) => userStore.user?.third,
          builder: (context, user, child) => textWidget(user),
        );
        break;
    }
  }
}

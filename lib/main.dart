import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:renda_clone/stores/game.dart';
import 'package:renda_clone/stores/timer.dart';
import 'package:renda_clone/stores/user.dart';
import 'package:renda_clone/util/hook/initalData.dart';
import 'pages/game.dart';
import 'pages/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  final data = await getIntialData();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UserStore>(
      create: (context) =>
          UserStore()..setInitalData(data["user"], data["users"]),
    ),
    ChangeNotifierProvider<GameStore>(
      create: (context) => GameStore(),
    ),
    ChangeNotifierProvider<TimerStore>(
      create: (context) => TimerStore(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'renda_clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: ThemeData.light()
            .textTheme
            .copyWith(
                bodyText1: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                bodyText2: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 12)

                // textTheme: TextTheme(
                //   bodyText1: TextStyle(),
                //   bodyText2: TextStyle(),
                )
            .apply(
              bodyColor: Colors.white,
            ),
        primarySwatch: Colors.blue,
        fontFamily: 'GenSenRounded',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Top.routeName,
      routes: <String, WidgetBuilder>{
        Top.routeName: (BuildContext context) => SafeArea(child: Top()),
        Game.routeName: (BuildContext context) => SafeArea(child: Game()),
      },
    );
  }
}

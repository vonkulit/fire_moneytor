// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:fire_moneytor/screens/dashboard_screen.dart';
import 'package:fire_moneytor/screens/main_screen.dart';
import 'package:fire_moneytor/screens/what_is_fire_screen.dart';
import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final CheckIfFirstTime _auth = CheckIfFirstTime();
  final bool firstPage = _auth.isFirst();
  final MyApp myApp = MyApp(
    initialRoute: firstPage ? '/home' : '/',
  );
  runApp(myApp);
}

class MyApp extends StatelessWidget {
  var initialRoute;

  // This widget is the root of your application.
  MyApp({Key? key, this.initialRoute}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(appBarTheme: const AppBarTheme(color: Color(0xFF2CDB30))),
      initialRoute: initialRoute,
      routes: {
        '/home': (context) => const WhatIsFireScreen(),
        '/': (context) => const DashBoardScreen(),
      },
    );
  }
}

class CheckIfFirstTime {
  int testerIfWorking = 1;
  bool isFirst() {
    if (testerIfWorking == 1) {
      return true;
    } else {
      return false;
    }
  }
}

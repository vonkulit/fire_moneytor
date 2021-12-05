// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:fire_moneytor/screens/screen_dashboard.dart';
import 'package:fire_moneytor/screens/screen_main.dart';
import 'package:fire_moneytor/screens/screen_wha_is_fire.dart';
import 'package:flutter/material.dart';
import 'functions/construct_income.dart';
import 'functions/construct_savings_invest.dart';
import 'functions/construct_spending.dart';
import 'screens/screen_main.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SpendingsAdapter());
  Hive.registerAdapter(SavingsInvestmentsAdapter());
  Hive.registerAdapter(IncomeAdapter());

  await Hive.openBox<Spendings>('listBank');
  await Hive.openBox<SavingsInvestments>('bankList');
  await Hive.openBox<Income>('incomeList');
  await Hive.openBox('assessment');

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

  void dispose() {
    // Closes all Hive boxes
    Hive.close();
  }

  // This widget is the root of your application.
  MyApp({Key? key, this.initialRoute}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F.I.R.E Moneytor',
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
  late bool status;
  final box = Hive.box<Spendings>('listBank');
  late final data2 = box.get('listBank');

  bool isFirst() {
    if (data2 == null) {
      status = true;
    } else {
      status = false;
    }
    return status;
  }
}

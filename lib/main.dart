import 'package:fire_moneytor/screens/dashboard_screen.dart';
import 'package:fire_moneytor/screens/main_screen.dart';
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

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var initialRoute;

  // This widget is the root of your application.
  MyApp({Key? key, this.initialRoute}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: initialRoute,
      routes: {
        '/': (context) => const DashBoardScreen(),
        '/home': (context) => const MyHomePage(),
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

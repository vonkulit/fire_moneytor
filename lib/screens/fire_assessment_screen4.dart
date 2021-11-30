import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class FireAssessmentScreen4 extends StatefulWidget {
  const FireAssessmentScreen4({Key? key}) : super(key: key);

  @override
  _FireAssessmentScreen4State createState() => _FireAssessmentScreen4State();
}

class _FireAssessmentScreen4State extends State<FireAssessmentScreen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('F.I.R.E Assessment'),
        backgroundColor: const Color(0xFF2CDB30),
      ),
    );
  }
}

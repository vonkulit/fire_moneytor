import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class FireAssessmentScreen3 extends StatefulWidget {
  const FireAssessmentScreen3({Key? key}) : super(key: key);

  @override
  _FireAssessmentScreen3State createState() => _FireAssessmentScreen3State();
}

class _FireAssessmentScreen3State extends State<FireAssessmentScreen3> {
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

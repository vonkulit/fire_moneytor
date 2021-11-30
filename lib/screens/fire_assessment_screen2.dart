import 'package:fire_moneytor/screens/fire_assessment_screen3.dart';
import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class FireAssessmentScreen2 extends StatefulWidget {
  const FireAssessmentScreen2({Key? key}) : super(key: key);

  @override
  _FireAssessmentScreen2State createState() => _FireAssessmentScreen2State();
}

class _FireAssessmentScreen2State extends State<FireAssessmentScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('F.I.R.E Assessment'),
        backgroundColor: const Color(0xFF2CDB30),
      ),
      floatingActionButton: SizedBox(
        width: 90.0,
        height: 40.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FireAssessmentScreen3()));
          },
          backgroundColor: const Color(0xFF2CDB30),
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: const Text(
            'Continue',
          ),
        ),
      ),
    );
  }
}

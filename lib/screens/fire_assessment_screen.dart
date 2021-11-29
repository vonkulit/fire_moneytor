import 'package:flutter/material.dart';

class FireAssessmentScreen extends StatefulWidget {
  const FireAssessmentScreen({Key? key}) : super(key: key);

  @override
  _FireAssessmentScreenState createState() => _FireAssessmentScreenState();
}

class _FireAssessmentScreenState extends State<FireAssessmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('F.I.R.E Assessment'),
      ),
    );
  }
}

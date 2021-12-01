import 'package:flutter/material.dart';

import '../widget/drawer_widget.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    Key? key,
    required this.age,
    required this.fire,
  }) : super(key: key);
  final String age;
  final double fire;

  String getAge() {
    return age;
  }

  double getFire() {
    return fire;
  }

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text("Results Page"),
        backgroundColor: const Color(0xFF2CDB30),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.age,
            ),
            Text(
              widget.fire.toString(),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70.0,
        height: 50.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: const Color(0xFF2CDB30),
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: const Text(
            'Go back',
          ),
        ),
      ),
    );
  }
}

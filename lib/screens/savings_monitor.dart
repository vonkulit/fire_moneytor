import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class SavingMonitorScreen extends StatefulWidget {
  const SavingMonitorScreen({Key? key}) : super(key: key);

  @override
  _SavingMonitorScreenState createState() => _SavingMonitorScreenState();
}

class _SavingMonitorScreenState extends State<SavingMonitorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text(
          'Monitor',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
        ),
        backgroundColor: const Color(0xFF2CDB30),
      ),
    );
  }
}

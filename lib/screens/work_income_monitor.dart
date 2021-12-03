import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class WorkIncomeMonitorScreen extends StatefulWidget {
  const WorkIncomeMonitorScreen({Key? key}) : super(key: key);

  @override
  _WorkIncomeMonitorScreenState createState() =>
      _WorkIncomeMonitorScreenState();
}

class _WorkIncomeMonitorScreenState extends State<WorkIncomeMonitorScreen> {
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

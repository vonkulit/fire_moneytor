import 'package:fire_moneytor/screens/about_us_screen.dart';
import 'package:fire_moneytor/screens/dashboard_screen.dart';
import 'package:fire_moneytor/screens/fire_assessment_screen1.dart';
import 'package:fire_moneytor/screens/main_screen.dart';
import 'package:fire_moneytor/screens/savings_monitor.dart';
import 'package:fire_moneytor/screens/spendings_monitor.dart';
import 'package:fire_moneytor/screens/what_is_fire_screen.dart';
import 'package:fire_moneytor/screens/work_income_monitor.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final padding = EdgeInsets.zero;
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedLocation = ''; // Option 2

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'images/Header_Drawer_Widget.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              children: const <Widget>[
                Positioned(
                  bottom: 12.0,
                  left: 16.0,
                  child: Text(
                    'Welcome!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: padding,
            child: Column(
              children: [
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Dashboard',
                  icon: Icons.space_dashboard,
                  onClicked: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const DashBoardScreen()),
                      (route) => false,
                    );
                  },
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'F.I.R.E Assessment',
                  icon: Icons.local_fire_department,
                  onClicked: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const FireAssessmentScreen()),
                      (route) => false,
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'MONITOR',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      )),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Expenses',
                  icon: Icons.attach_money,
                  onClicked: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const SpendingMonitorScreen()),
                      (route) => false,
                    );
                  },
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Savings',
                  icon: Icons.savings,
                  onClicked: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const SavingMonitorScreen()),
                      (route) => false,
                    );
                  },
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Work/Income',
                  icon: Icons.work,
                  onClicked: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) =>
                              const WorkIncomeMonitorScreen()),
                      (route) => false,
                    );
                  },
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'What is F.I.R.E',
                  icon: Icons.lightbulb,
                  onClicked: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const WhatIsFireScreen()),
                      (route) => false,
                    );
                  },
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'About us',
                  icon: Icons.people_sharp,
                  onClicked: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const AboutUsScreen()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.black;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}

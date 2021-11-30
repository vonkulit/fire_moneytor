import 'package:fire_moneytor/screens/about_us_screen.dart';
import 'package:fire_moneytor/screens/dashboard_screen.dart';
import 'package:fire_moneytor/screens/main_screen.dart';
import 'package:fire_moneytor/screens/monitor_screen.dart';
import 'package:fire_moneytor/screens/what_is_fire_screen.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final padding = EdgeInsets.zero;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              color: Color(0xFF2CDB30),
            ),
            child: Stack(
              children: const <Widget>[
                Positioned(
                  bottom: 12.0,
                  left: 16.0,
                  child: Text(
                    'HEY!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
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
                const SizedBox(height: 24),
                buildMenuItem(
                  text: 'Dashboard',
                  icon: Icons.space_dashboard,
                  onClicked: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DashBoardScreen()));
                  },
                ),
                const SizedBox(height: 24),
                buildMenuItem(
                  text: 'F.I.R.E Assessment',
                  icon: Icons.local_fire_department,
                  onClicked: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyHomePage()));
                  },
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Monitor',
                  icon: Icons.query_stats,
                  onClicked: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MonitorScreen()));
                  },
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'What is F.I.R.E',
                  icon: Icons.device_unknown,
                  onClicked: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const WhatIsFireScreen()));
                  },
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'About us',
                  icon: Icons.people_sharp,
                  onClicked: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AboutUsScreen()));
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

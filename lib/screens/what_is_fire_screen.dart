import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class WhatIsFireScreen extends StatefulWidget {
  const WhatIsFireScreen({Key? key}) : super(key: key);

  @override
  _WhatIsFireScreenState createState() => _WhatIsFireScreenState();
}

class _WhatIsFireScreenState extends State<WhatIsFireScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text(
          'What is F.I.R.E?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
        ),
        backgroundColor: const Color(0xFF2CDB30),
      ),
      body: Center(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF2CDB30)),
              ),
              child: const Text('Start Fire Assessment'),
            ),
          ),
        ),
      ),
    );
  }
}

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
        title: const Text('What is F.I.R.E?'),
        backgroundColor: const Color(0xFF2CDB30),
      ),
    );
  }
}

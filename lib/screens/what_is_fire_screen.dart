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
      appBar: AppBar(
        title: const Text('What is F.I.R.E?'),
      ),
    );
  }
}

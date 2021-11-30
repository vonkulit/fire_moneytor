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

// unang version tabi muna naten baka magamit ko pa HAHA
/*child: ListView(
padding: EdgeInsets.zero,
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
ListTile(
leading: const Icon(Icons.space_dashboard),
title: const Text(
'Dashboard',
),
onTap: () {},
),
ListTile(
leading: const Icon(Icons.local_fire_department),
title: const Text(
'F.I.R.E Assessment',
),
onTap: () {},
),
ListTile(
leading: const Icon(Icons.query_stats),
title: const Text(
'Monitor',
),
onTap: () {},
),
ListTile(
leading: const Icon(Icons.device_unknown),
title: const Text(
'What is F.I.R.E',
),
onTap: () {},
),
ListTile(
leading: const Icon(Icons.people_sharp),
title: const Text(
'About us',
),
onTap: () {},
),
],
),

 */

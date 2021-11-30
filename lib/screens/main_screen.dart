import 'package:fire_moneytor/screens/fire_assessment_screen1.dart';
import '../widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('F.I.R.E Assessment'),
        backgroundColor: const Color(0xFF2CDB30),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'explanation about FIRE',
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 90.0,
        height: 40.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FireAssessmentScreen()));
          },
          backgroundColor: const Color(0xFF2CDB30),
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: const Text(
            'Continue',
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

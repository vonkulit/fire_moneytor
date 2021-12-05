import 'package:fire_moneytor/functions/construct_about_us.dart';
import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  FunctionStudents functionStudent = FunctionStudents();
  ListView getAboutUs() {
    List<Widget> name = [];


    for (var i = 0; i < 4; i++) {
      name.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: Container(
            height: 300,
            margin: const EdgeInsets.only(bottom: 10.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  "images/${functionStudent.bank[i].imageN}",
                  width: 190,
                ),
                Flexible(
                  child: Text(
                    '${functionStudent.bank[i].name} \n '
                    '${functionStudent.bank[i].university}\n'
                    '${functionStudent.bank[i].course}\n'
                    '${functionStudent.bank[i].quote}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      height: 1.8,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 1.0),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return ListView(
      children: name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),
      body: Center(child: getAboutUs()),
    );
  }
}

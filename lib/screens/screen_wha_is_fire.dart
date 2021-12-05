import 'package:fire_moneytor/screens/screen_fire_assessment1.dart';
import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text(
          'What is F.I.R.E?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Background_What_is_Fire.jpg'),
              fit: BoxFit.fill),
        ),
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  color: Colors.white,
                  height: 500,
                  width: 380,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1, top: 5),
                    child: Column(children: <Widget>[
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset(
                          'images/Pig_What_is_Fire.gif',
                        ),
                      ),
                      Text(
                        '  What is F.I.R.E?',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Text(
                          'FIRE stands for Financial Independence, Retire Early. It is a program wherein extreme savings and investment are carefully planned and executed in order to retire much earlier than what traditional budgets and retirement plans would make. By dedicating a majority of their income to savings, followers of the FIRE movement hope to be able to quit their jobs and live solely off small withdrawals from their portfolios decades before they reach 65. But with millennials discovering the FIRE movement at an early age, some are retiring as early as 30',
                          textAlign: TextAlign.justify,



                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 230.0,
        height: 40.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const FireAssessmentScreen(),
                ));
          },
          backgroundColor: const Color(0xFF2CDB30),
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: const Text(
            'Start F.I.R.E Assessment',
          ),
        ),
      ),
    );
  }
}

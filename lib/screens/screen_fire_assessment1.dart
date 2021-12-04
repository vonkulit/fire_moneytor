import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen_fire_assessment2.dart';

class FireAssessmentScreen extends StatefulWidget {
  const FireAssessmentScreen({Key? key}) : super(key: key);

  @override
  _FireAssessmentScreenState createState() => _FireAssessmentScreenState();
}

class _FireAssessmentScreenState extends State<FireAssessmentScreen> {
  final textFieldExpenses = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textFieldExpenses.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text(
          'F.I.R.E Assessment',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 10, 220),
            child: Text(
              'About Monthly Expenses',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              'Enter Expenses',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.grey[700],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 170, left: 20),
            child: TextField(
              controller: textFieldExpenses,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: 'Enter Amount',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                contentPadding: EdgeInsets.all(10.0),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 100),
            child: Text(
              "If you don't know you can enter an estimate or a dummy value and we will help you get the exact value later with our monitoring features",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 90.0,
        height: 40.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FireAssessmentScreen2(
                      textFieldExpenses: textFieldExpenses.text,
                    )));
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

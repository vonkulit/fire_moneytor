import 'package:fire_moneytor/screens/screen_fire_assessment3.dart';
import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FireAssessmentScreen2 extends StatefulWidget {
  final String textFieldExpenses;

  const FireAssessmentScreen2({Key? key, required this.textFieldExpenses})
      : super(key: key);

  @override
  _FireAssessmentScreen2State createState() => _FireAssessmentScreen2State();
}

class _FireAssessmentScreen2State extends State<FireAssessmentScreen2> {
  final textFieldSavings = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text(
          'F.I.R.E Assessment',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
        ),
        backgroundColor: const Color(0xFF2CDB30),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 10, 220),
            child: Text(
              'About Savings and Investments ${widget.textFieldExpenses}',
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
              'Enter Current savings and investments',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.grey[700],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 170, left: 20),
            child: TextField(
              controller: textFieldSavings,
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
                builder: (context) => FireAssessmentScreen3(
                      textFieldExpenses: widget.textFieldExpenses,
                      textFieldSavings: textFieldSavings.text,
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

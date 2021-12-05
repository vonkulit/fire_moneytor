import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'screen_fire_assessment2.dart';

class FireAssessmentScreen extends StatefulWidget {
  const FireAssessmentScreen({Key? key}) : super(key: key);

  @override
  _FireAssessmentScreenState createState() => _FireAssessmentScreenState();
}

class _FireAssessmentScreenState extends State<FireAssessmentScreen> {
  final textFieldExpenses = TextEditingController();

  late final data2;

  _addItem() async{
    await data2.clear();
    data2.add(textFieldExpenses.value.text);
    print(data2);
    print("I am the length " + data2.length.toString() );
    print("assessment 1 clear");
  }


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
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Text(
              'The first step on the FIRE Movement is to get to know your Monthly Expenses. This will help determine how much will you need to money you need saved and invested to cover your daily expenses. With that you can enter your Monthly Expenses on the TextField below if you already know it. ',
              style: TextStyle(

                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.justify,
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
                hintText: 'Monthly Expenses',
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
          ),Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Text(
              'If not, you can just enter zero to proceed with the assessment. Do not worry, we have provided a Monthly Monitoring Expenses within the app to help you start',
              style: TextStyle(

                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 90.0,
        height: 40.0,
        child: FloatingActionButton(
          onPressed: () {
            data2 = Hive.box("assessment");
            _addItem();

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

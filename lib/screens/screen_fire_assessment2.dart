import 'package:fire_moneytor/screens/screen_fire_assessment3.dart';
import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

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
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textFieldSavings.dispose();
    super.dispose();
  }

  late final data5;

  _addItem(){

    data5.add(textFieldSavings.value.text);

    print(data5);
    print("I am the length " + data5.length.toString() );
    print("assessment 2 clear");
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
        backgroundColor: const Color(0xFF2CDB30),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text("The second thing that we need to know is your total money saved in the bank, and assets invested. There are researches that says that you can always withdraw about 4% of your total assets a year without ever running out of money again. With that, you can enter the total savings and investment that you have, as it will help us determine how far you are from being able to retire  ",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],

              ),
              textAlign: TextAlign.justify,
            ),
          ),

          Container(
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: TextField(
              controller: textFieldSavings,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: 'Enter Amount',
                hintText: 'Total Savings and Investments',
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
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 10, 220),
            child: Text('Once again, if you do not know your total savings and investments, you can just enter an estimate or 0 to continue with the assessment. You can also checkout the Savings and Investment Monitoring Feature of the App as it may help you with your journey to Financial Freedom!',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],

              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 90.0,
        height: 40.0,
        child: FloatingActionButton(
          onPressed: () {
            data5 = Hive.box("assessment");
            _addItem();
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

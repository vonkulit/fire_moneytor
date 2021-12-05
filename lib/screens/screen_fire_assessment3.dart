import 'package:auto_size_text/auto_size_text.dart';
import 'package:fire_moneytor/functions/calcbrain.dart';
import 'package:fire_moneytor/functions/construct_income.dart';
import 'package:fire_moneytor/functions/construct_savings_invest.dart';
import 'package:fire_moneytor/screens/screen_dashboard.dart';
import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class FireAssessmentScreen3 extends StatefulWidget {
  final String textFieldExpenses;
  final String textFieldSavings;

  const FireAssessmentScreen3(
      {Key? key,
      required this.textFieldExpenses,
      required this.textFieldSavings})
      : super(key: key);

  @override
  _FireAssessmentScreen3State createState() => _FireAssessmentScreen3State();
}

class _FireAssessmentScreen3State extends State<FireAssessmentScreen3> {
  final textFieldIncome = TextEditingController();

 late final data2;


  _addItem(){
    data2.add(textFieldIncome.value.text);

    print(data2);
    print("I am the length " + data2.length.toString() );
    print("assessment 3 clear");
  }

  _readItem(){
    for(int i = 0; i<data2.length;i++){
      print(data2.get(i).toString());
      print(data2.length.toString());
    }
  }

  String calculateAge(){
    CalcBrain calculator = CalcBrain(monthlyexpense: double.parse(data2.get(0, defaultValue:0)), savings: double.parse(data2.get(1,defaultValue:0)), monthlyincome: double.parse(data2.get(2,defaultValue:0)));
    return calculator.calculateAge();
  }

  String calculateFireGoal(){
    CalcBrain calculator = CalcBrain(monthlyexpense: double.parse(data2.get(0,defaultValue:0)), savings: double.parse(data2.get(1, defaultValue:0)), monthlyincome: double.parse(data2.get(2,defaultValue:0)));
    return calculator.fireGoal();
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
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text(
              'The last part of the assessment is to list down your monthly income, or the total income you receive monthly from your different jobs, or side hustles. Listing this within the assessment will help us know how fast will it take for you to retire, assuming that you are saving all your income. Remember, in the world today, having a single job does not help you anymore to be financially free, so you should take this as a sign to look for some small side hustles to earn from time to time. A Textfield is provided below, if you already know how much you are earning monthly then feel free to enter it to know how far you need to achieve financial freedom',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: TextField(
              controller: textFieldIncome,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: 'Enter Amount',
                hintText: 'Monthly Income After Tax if possible',
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
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Text('If you do not know your monthly income, or you would like to track each one of them, then you might want to check out the income monitoring features that the app has. May it motivate you to hustle more towards your own financial independence',
              style: TextStyle(
                fontSize: 18,
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
            data2 = Hive.box("assessment");
            _addItem();
            _readItem();

            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                contentPadding: EdgeInsets.zero,
                backgroundColor: const Color(0xFFB9FFB9),
                title: Text(
                  'Results',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                content: Container(
                  width: 700,
                  height: 360,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  child: ListView(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 15, right: 20),
                              child: SizedBox(
                                child: AutoSizeText("Based on the Expenses that you have entered, your target retirement fund that will cover your day to day expenses shall be:" ,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[700]),
                                  textAlign: TextAlign.center,
                                  maxLines: 7,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, right: 20),
                              child: SizedBox(
                                child: AutoSizeText("~ " + calculateFireGoal() + " ~",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700]),
                                  textAlign: TextAlign.center,
                                  maxLines: 4,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),Row(
                        children: <Widget>[
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 15, right: 20),
                              child: SizedBox(
                                child: AutoSizeText("Additionally, based on your current number of savings and investments, together with your monthly income, you are expected to reach your goal within:" ,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[700]),
                                  textAlign: TextAlign.center,
                                  maxLines: 5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, bottom: 30, right: 20),
                              child: SizedBox(
                                child: AutoSizeText("~ " + calculateAge() + " ~",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700]),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFF2CDB30),
                        ),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DashBoardScreen(),
                            ));
                      },
                      child: const Text('Dashboard')),
                ],
              ),
            );
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

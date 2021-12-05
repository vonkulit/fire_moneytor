import 'package:fire_moneytor/screens/screen_dashboard.dart';
import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              'About Work and Income',
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
              'Enter monthly income after tax if possible',
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
              controller: textFieldIncome,
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
          onPressed: () => showDialog<String>(
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
                height: 370,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 25),
                          child: SizedBox(
                            child: Text(
                              'With your current data\n'
                              'you have 43 years to reach\n'
                              'your \$1,000,000 goal\n'
                              'for retirement. You can\n'
                              'further bring it closer by\n'
                              'adding more to your inv.\n'
                              'saving, decrease your\n'
                              'monthly expenses, and\n'
                              'look for more side hustles.\n\n'
                              'GOOD LUCK FUTURE\n'
                              'MILLIONAIRE!',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF2CDB30),
                              ),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const DashBoardScreen(),
                                  ));
                            },
                            child: const Text('Dashboard')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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

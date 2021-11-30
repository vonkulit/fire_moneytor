import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'fire_assessment_screen2.dart';

class FireAssessmentScreen extends StatefulWidget {
  const FireAssessmentScreen({Key? key}) : super(key: key);

  @override
  _FireAssessmentScreenState createState() => _FireAssessmentScreenState();
}

class _FireAssessmentScreenState extends State<FireAssessmentScreen> {
  int input = 0;

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
          children: <Widget>[
            const Text(
              '''
              About Monthly Expenses
              
              ''',
            ),
            SizedBox(
              width: 290,
              child: TextField(
                onChanged: (value) {
                  input = value as int;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blueGrey[10],
                  border: const OutlineInputBorder(),
                  labelText: 'Enter Expenses',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  contentPadding: const EdgeInsets.all(20.0),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            const Text('''
                   
        If you don't know you can enter an estimate or a dummy value and we will help you get the exact value later with our monitoring features
                    
                    ''')
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 90.0,
        height: 40.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FireAssessmentScreen2()));
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

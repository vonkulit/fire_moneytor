import 'package:fire_moneytor/functions/calcbrain.dart';
import 'package:fire_moneytor/screens/result_screen.dart';
import 'package:flutter/material.dart';

class MonitorScreen extends StatefulWidget {
  const MonitorScreen({Key? key}) : super(key: key);

  @override
  _MonitorScreenState createState() => _MonitorScreenState();
}

class _MonitorScreenState extends State<MonitorScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _spendingController = new TextEditingController();
    TextEditingController _incomeController = new TextEditingController();
    TextEditingController _savingsController = new TextEditingController();
    TextEditingController _ageController = new TextEditingController();
    double income = 0.0;
    double mExpenses = 0.0;
    double savings = 0.0;
    int age = 0;
    void dispose() {
      _spendingController.dispose();
      _incomeController.dispose();
      _savingsController.dispose();
      _ageController.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitor'),
        backgroundColor: const Color(0xFF2CDB30),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '''
              Input your monthly expenses,savings, income, and age here.
              
              ''',
            ),
            SizedBox(
              width: 290,
              child: TextField(
                controller: _spendingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your monthly expenses here.',
                  contentPadding: EdgeInsets.all(20.0),
                ),
              ),
            ),
            SizedBox(
              width: 290,
              child: TextField(
                controller: _savingsController,
                keyboardType: TextInputType.number,
                // Only numbers can be entered
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your savings here.',
                  contentPadding: EdgeInsets.all(20.0),
                ),
              ),
            ),
            SizedBox(
              width: 290,
              child: TextField(
                controller: _incomeController,
                keyboardType: TextInputType.number,
                // Only numbers can be entered
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your income here.',
                  contentPadding: EdgeInsets.all(20.0),
                ),
              ),
            ),
            SizedBox(
              width: 290,
              child: TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                // Only numbers can be entered
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your age here.',
                  contentPadding: EdgeInsets.all(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70.0,
        height: 50.0,
        child: FloatingActionButton(
          onPressed: () {
            income = double.parse(_incomeController.value.text);
            mExpenses = double.parse(_spendingController.value.text);
            savings = double.parse(_savingsController.value.text);
            age = int.parse(_ageController.value.text);
            print("income: $income");
            print("Monthly Expenses: $mExpenses");
            print("Savings: $savings");
            print("Age: $age");
            CalcBrain calcu = new CalcBrain(
                age: age,
                monthlyexpense: mExpenses,
                savings: savings,
                monthlyincome: income);
            calcu.calculateAnnualExpense();
            calcu.calculateAnnualIncome();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                        age: calcu.calculateAge(),
                        fire: calcu.calculateFire())));
          },
          backgroundColor: const Color(0xFF2CDB30),
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: const Text(
            'Continue',
          ),
        ),
      ),
    );
  }
}

/* Savings
class _MonitorScreenState extends State<MonitorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitor'),
        backgroundColor: const Color(0xFF2CDB30),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '''
              Input your savings here.

              ''',
            ),
            SizedBox(
              width: 290,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your savings here.',
                  contentPadding: EdgeInsets.all(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70.0,
        height: 50.0,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF2CDB30),
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: const Text(
            'Continue',
          ),
        ),
      ),
    );
  }
}*/
/* Income
class _MonitorScreenState extends State<MonitorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitor'),
        backgroundColor: const Color(0xFF2CDB30),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '''
              Input your monthly here.

              ''',
            ),
            SizedBox(
              width: 290,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your monthly income here.',
                  contentPadding: EdgeInsets.all(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70.0,
        height: 50.0,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF2CDB30),
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: const Text(
            'Continue',
          ),
        ),
      ),
    );
  }
}*/

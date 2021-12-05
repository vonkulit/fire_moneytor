import 'package:auto_size_text/auto_size_text.dart';
import 'package:fire_moneytor/functions/construct_income.dart';
import 'package:fire_moneytor/functions/construct_savings_invest.dart';
import 'package:fire_moneytor/functions/construct_spending.dart';
import 'package:fire_moneytor/functions/functions_income.dart';
import 'package:fire_moneytor/functions/functions_savings_invest.dart';
import 'package:fire_moneytor/functions/functions_spending.dart';
import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  late String _displayProgress = "";
  late final data1;
  late final data2;
  late final data3;
  late List<GDPData> _ExpensesData = [];
  late List<GDPData> _IncomeData = [];
  late List<GDPData> _SavingsData = [];

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    data1 = Hive.box<Income>('incomeList');
    data2 = Hive.box<SavingsInvestments>('bankList');
    data3 = Hive.box<Spendings>('listBank');
    chartSpendings();
    chartIncome();
    chartSavings();
    _currentProgress();
    _ExpensesData = ExpensesChartData();
    _IncomeData = IncomeChartData();
    _SavingsData = SavingsChartData();
    super.initState();
  }

  Map map1 = Map();
  Map map2 = Map();
  Map map3 = Map();
  List _values1 = []; //expenses
  List _values2 = []; //income
  List _values3 = []; //savings
  List _keys1 = [];
  List _keys2 = [];
  List _keys3 = [];

  chartSavings() {
    for (int i = 0; i < data2.length; i++) {
      if (!map3.containsKey(data2.getAt(i).category)) {
        map3[data2.getAt(i).category] = 1;
      } else {
        map3[data2.getAt(i).category] += 1;
      }
    }

    _keys3 = map3.keys.toList();
    _values3 = map3.values.toList();
  }

  chartIncome() {
    for (int i = 0; i < data1.length; i++) {
      if (!map2.containsKey(data1.getAt(i).category)) {
        map2[data1.getAt(i).category] = 1;
      } else {
        map2[data1.getAt(i).category] += 1;
      }
    }

    _keys2 = map2.keys.toList();
    _values2 = map2.values.toList();
  }

  chartSpendings() {
    for (int i = 0; i < data3.length; i++) {
      if (!map1.containsKey(data3.getAt(i).category)) {
        map1[data3.getAt(i).category] = 1;
      } else {
        map1[data3.getAt(i).category] += 1;
      }
    }

    _keys1 = map1.keys.toList();
    _values1 = map1.values.toList();
  }

  List getKeys1() {
    return _keys1;
  }

  List getValues1() {
    return _values1;
  }

  List getKeys2() {
    return _keys2;
  }

  List getValues2() {
    return _values2;
  }

  List getKeys3() {
    return _keys3;
  }

  List getValues3() {
    return _values3;
  }

  _currentProgress() {
    FunctionSavings calculator = FunctionSavings();
    _displayProgress = "₱" + calculator.calculateSavingsTotal(data2);
  }

  String fireGoal() {
    FunctionSpending calculator = FunctionSpending();
    return "₱" + calculator.calculateSpendTotal(data3);
  }

  String totalExpenses() {
    FunctionSpending calculator = FunctionSpending();
    return "₱" + calculator.calculateSpendTotal(data3);
  }

  String totalSavings() {
    FunctionSavings calculator = FunctionSavings();
    return "₱" + calculator.calculateSavingsTotal(data2);
  }

  String totalIncome() {
    FunctionIncome calculator = FunctionIncome();
    return "₱" + calculator.calculateIncomeTotal(data1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(30),
              height: 140,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      children: [
                        Expanded(
                            child: AutoSizeText('Current Progress: ',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                                maxLines: 1)),
                        Expanded(
                            child: AutoSizeText(_displayProgress,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.right,
                                maxLines: 1)),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 20,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Center(
                    child: Text('Your Fire Goal is ' + fireGoal(),
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child: const Text('"To Financial Freedom!"'),
                  )
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        children: [
                          Expanded(
                              child: AutoSizeText('Expenses Overview',
                                  style: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  maxLines: 1)),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 10,
                      thickness: 1,
                      indent: 100,
                      endIndent: 100,
                    ),
                    Expanded(
                        child: AutoSizeText(' Total: ' + totalExpenses(),
                            style: TextStyle(
                                color: Colors.grey[850],
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                            maxLines: 1)),
                    SfCircularChart(
                      legend: Legend(isVisible: true),
                      series: <CircularSeries>[
                        PieSeries<GDPData, String>(
                            dataSource: _ExpensesData,
                            xValueMapper: (GDPData data, _) => data.continent,
                            yValueMapper: (GDPData data, _) => data.gdp,
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true))
                      ],
                    )
                  ],
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        children: [
                          Expanded(
                              child: AutoSizeText('Savings Overview',
                                  style: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  maxLines: 1)),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 10,
                      thickness: 1,
                      indent: 100,
                      endIndent: 100,
                    ),
                    Expanded(
                        child: AutoSizeText(' Total: ' + totalSavings(),
                            style: TextStyle(
                                color: Colors.grey[850],
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                            maxLines: 1)),
                    SfCircularChart(
                      legend: Legend(isVisible: true),
                      series: <CircularSeries>[
                        PieSeries<GDPData, String>(
                            dataSource: _SavingsData,
                            xValueMapper: (GDPData data, _) => data.continent,
                            yValueMapper: (GDPData data, _) => data.gdp,
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true))
                      ],
                    )
                  ],
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        children: [
                          Expanded(
                              child: AutoSizeText('Work/Income Overview',
                                  style: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  maxLines: 1)),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 10,
                      thickness: 1,
                      indent: 100,
                      endIndent: 100,
                    ),
                    Expanded(
                        child: AutoSizeText(' Total: ' + totalIncome(),
                            style: TextStyle(
                                color: Colors.grey[850],
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                            maxLines: 1)),
                    SfCircularChart(
                      legend: Legend(isVisible: true),
                      series: <CircularSeries>[
                        PieSeries<GDPData, String>(
                            dataSource: _IncomeData,
                            xValueMapper: (GDPData data, _) => data.continent,
                            yValueMapper: (GDPData data, _) => data.gdp,
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true))
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  List<GDPData> ExpensesChartData() {
    List ourKeys = getKeys1();

    List ourValues = getValues1();

    List<GDPData> chartData = [];
    for (int i = 0; i < ourValues.length; i++) {
      chartData.add(GDPData(ourKeys[i], ourValues[i]));
    }

    return chartData;
  }

  List<GDPData> IncomeChartData() {
    List ourKeys = getKeys2();

    List ourValues = getValues2();

    List<GDPData> chartData = [];
    for (int i = 0; i < ourValues.length; i++) {
      chartData.add(GDPData(ourKeys[i], ourValues[i]));
    }

    return chartData;
  }

  List<GDPData> SavingsChartData() {
    List ourKeys = getKeys3();

    List ourValues = getValues3();

    List<GDPData> chartData = [];
    for (int i = 0; i < ourValues.length; i++) {
      chartData.add(GDPData(ourKeys[i], ourValues[i]));
    }

    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
//
// List<GDPData> incomeChartData() {
//   // List ourKeys = FunctionsSavings().getKeys();
//
//   // List ourValues = FunctionsSavings().getValues();
//
//   List<GDPData> chartData = [];
//   for (int i = 0; i < ourValues.length; i++) {
//     chartData.add(GDPData(ourKeys[i], ourValues[i]));
//   }
//
//   return chartData;
// }
//
// List<GDPData> savingsChartData() {
//   // List ourKeys = FunctionSavings().getKeys();
//
//   // List ourValues = FunctionSavings().getValues();
//
//   List<GDPData> chartData = [];
//   for (int i = 0; i < ourValues.length; i++) {
//     chartData.add(GDPData(ourKeys[i], ourValues[i]));
//   }
//
//   return chartData;
// }

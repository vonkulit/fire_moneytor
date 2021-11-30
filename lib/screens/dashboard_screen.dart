import 'package:fire_moneytor/functions/spending_functions.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  late List<GDPData> _chartData;

  @override
  void initState(){
    _chartData = getChartData();
        super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(30),
              height: 140,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      children: const [
                        Expanded(
                            child: AutoSizeText('Current Progress: ',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                                maxLines: 1)),
                        Expanded(
                            child: AutoSizeText(' ₱10',
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
                  const Center(
                    child: Text('Your Fire Goal is ₱1,000,000 ',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child: const Text('"Did you know?"'),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        children:  [
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
                        child: AutoSizeText(' Total: ₱10',
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
                        dataSource: _chartData,
                        xValueMapper: (GDPData data,_) => data.continent,
                        yValueMapper: (GDPData data,_) => data.gdp,
                        dataLabelSettings: DataLabelSettings(isVisible: true)
                      )
                    ], )

                  ],
                )),
            Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        children:  [
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
                        child: AutoSizeText(' Total: ₱10',
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
                            dataSource: _chartData,
                            xValueMapper: (GDPData data,_) => data.continent,
                            yValueMapper: (GDPData data,_) => data.gdp,
                            dataLabelSettings: DataLabelSettings(isVisible: true)
                        )
                      ], )

                  ],
                )),
            Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        children:  [
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
                        child: AutoSizeText(' Total: ₱10',
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
                            dataSource: _chartData,
                            xValueMapper: (GDPData data,_) => data.continent,
                            yValueMapper: (GDPData data,_) => data.gdp,
                            dataLabelSettings: DataLabelSettings(isVisible: true)
                        )
                      ], )

                  ],
                ))

          ],
        ),
      ),
    );
  }
  List<GDPData> getChartData(){
    List ourKeys = new SpendingList().getKeys();

    List ourValues = new SpendingList().getValues();

      List<GDPData> chartData = [

      ];
    for(int i = 0; i < ourValues.length; i++){
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
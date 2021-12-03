// ignore_for_file: avoid_print
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fire_moneytor/functions/calcbrain.dart';
import 'package:fire_moneytor/screens/result_screen.dart';
import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:fire_moneytor/functions/spending_construct.dart';

class MonitorScreen extends StatefulWidget {
  const MonitorScreen({Key? key}) : super(key: key);

  @override
  _MonitorScreenState createState() => _MonitorScreenState();
}

class _MonitorScreenState extends State<MonitorScreen> {



  final itemName = TextEditingController();
  final itemType = TextEditingController();
  final itemPrice = TextEditingController();

  void dispose() {
    itemName.dispose();
    itemType.dispose();
    itemPrice.dispose();
  }

// Items in the list
  final _items = [];
  List _number = [];


  List<Paint> paints = <Paint>[
    Paint(1, 'Red', Colors.red),
    Paint(2, 'Blue', Colors.blue),
    Paint(3, 'Green', Colors.green),
    Paint(4, 'Lime', Colors.lime),
    Paint(5, 'Indigo', Colors.indigo),
    Paint(6, 'Yellow', Colors.yellow)
  ];

  // The key of the list
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  // Add a new item to the list
  // This is trigger when the floating button is pressed
  void _addItem() {
    _items.insert(
        0,
        Spendings(
            item: itemName.value.text,
            category: itemType.value.text,
            price: double.parse(itemPrice.value.text)));
    _key.currentState!.insertItem(0, duration: Duration(seconds: 1));
    print("Numbers: " + _number.toString());
    print("Items: " + _items.toString());
    itemName.clear();
    itemPrice.clear();
    itemType.clear();

    setState(() {
      for (int i = 0; i < _items.length; i++) {
        paints[i].checkbox = false;
        paints[i].selected = false;
      }
    });
    Navigator.pop(context, 'OK');
  }

  void remover() {
    _number.sort();
    List reverseList = List.from(_number.reversed);
    print(reverseList.toString());
    for (int i = 0; i < reverseList.length; i++) {
      print("Numbers: " + _number.toString());
      print("Items: " + _items.toString());
      paints[reverseList[i]].selected = !paints[reverseList[i]].selected;
      _removeItem(reverseList[i]);
    }
    for (int i = 0; i < _items.length; i++) {
      paints[i].checkbox = !paints[i].checkbox;
      paints[i].selected = false;
    }
    _number = [];
    setState(() {
      isSwitch = !isSwitch;
    });
  }

  // Remove an item
  // This is trigger when the trash icon associated with an item is tapped
  void _removeItem(int index) {
    _key.currentState!.removeItem(
      index,
      (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            color: Colors.red,
            child: ListTile(
              title: Center(child: Text("Deleted",style: TextStyle(color: Colors.white),)),
            ),
          ),
        );
        ;
      },
    );
    _items.removeAt(index);

    print(_items);
  }
  bool isSwitch = false;
  Color button_color() {
    if (isSwitch) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
  Icon button_icon() {
    if (isSwitch) {
      return const Icon(Icons.delete);
    } else {
      return const Icon(Icons.add);
    }

    return const Icon(Icons.add);
  }

  decide(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
        drawer: const DrawerWidget(),
        appBar: AppBar(
        title: const Text('Monitoring'),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Text('Expenses List',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 460,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  Container(
                    child: ListTile(
                      leading: Visibility(
                        visible: false,
                        child: Icon(Icons.circle_outlined),

                      ),
                      minLeadingWidth: 10,
                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, //Center Row contents horizontally,
                        children: [
                          const AutoSizeText(
                            'Name',
                            textAlign: TextAlign.left,
                            maxLines: 1, style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            width: 70,
                            child: const Center(
                                child: AutoSizeText('Type', maxLines: 1, style: TextStyle(fontWeight: FontWeight.bold),)),
                          ),
                        ],
                      ),
                      trailing: Container(
                        width: 60,
                        child: const AutoSizeText(
                          'Price',
                          maxLines: 1, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 0,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Expanded(
                    child: Card(
                      child: AnimatedList(
                        key: _key,
                        initialItemCount: 0,
                        itemBuilder: (_, index, animation) {
                          return SizeTransition(
                            key: UniqueKey(),
                            sizeFactor: animation,
                            child: ListTile(
                              leading: !(paints[index].selected)
                                  ? Visibility(
                                  visible: paints[index].checkbox,
                                  child: Icon(Icons.circle_outlined))
                                  : Icon(Icons.check_circle_rounded),
                              minLeadingWidth: 0,
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, //Center Row contents horizontally,
                                children: [
                                  AutoSizeText(
                                    _items[index].item,
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                  ),
                                  Container(
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius:
                                        const BorderRadius.all(Radius.circular(100))),
                                    child: Center(
                                        child:
                                        AutoSizeText(_items[index].category, maxLines: 1)),
                                  ),
                                ],
                              ),
                              trailing: Container(
                                width: 60,
                                child: AutoSizeText(
                                  '₱' + _items[index].price.toString(),
                                  maxLines: 1,

                                ),
                              ),
                              onTap: () {
                                if (paints[index].checkbox) {
                                  setState(
                                        () {
                                      paints[index].selected = !paints[index].selected;
                                    },
                                  );
                                  if (_number.contains(index)) {
                                    _number.remove(index);
                                    print(_number);
                                  } else {
                                    _number.add(index);
                                    print(_number);
                                  }
                                } else {}
                                print("Selected: " + paints[index].selected.toString());
                                print("Vsisible: " + paints[index].checkbox.toString());
                              },
                              selected: paints[index].checkbox,
                              onLongPress: () {
                                setState(() {
                                  isSwitch = !isSwitch;
                                  for (int i = 0; i < _items.length; i++) {
                                    paints[i].checkbox = !paints[i].checkbox;
                                    paints[i].selected = false;
                                  }
                                  _number.clear();
                                });

                                print("Selected: " + paints[index].selected.toString());
                                print("Vsisible: " + paints[index].checkbox.toString());
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: Row(
                children: const [
                  Expanded(
                      child: AutoSizeText('Total: ',
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
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 70, 30, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: FloatingActionButton(
                    backgroundColor: button_color(),
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    child: button_icon(),
                    onPressed: () {
                      if (isSwitch) {
                        remover();
                      } else {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Add Item (Monthly Expense)'),
                            content: Container(
                              height: 200,
                              width: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: TextField(
                                      controller: itemName,
                                      decoration: const InputDecoration(
                                        labelText: 'Name',
                                        border: OutlineInputBorder(),
                                        hintText: 'ex. Globe/Smart/BDO/Food',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextField(
                                      controller: itemType,
                                      decoration: const InputDecoration(
                                        labelText: 'Type',
                                        border: OutlineInputBorder(),
                                        hintText:
                                            'ex. Food/Water Bill/Electric Bill',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextField(
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      keyboardType: TextInputType.number,
                                      controller: itemPrice,
                                      decoration: const InputDecoration(
                                        labelText: 'Price',
                                        border: OutlineInputBorder(),
                                        hintText: 'ex. 1000 / 100/ 10',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () { Navigator.pop(context, 'Cancel');
                                itemName.clear();
                                itemPrice.clear();
                                itemType.clear();

                                } ,
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: _addItem,
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      );
  }
}

class Paint {
  final int id;
  final String title;
  final Color colorpicture;
  bool selected = false;
  bool checkbox = false;

  Paint(this.id, this.title, this.colorpicture);
}


/*
      final _spendingController = TextEditingController();
    final itemName = TextEditingController();
    final itemType = TextEditingController();
    final itemPrice = TextEditingController();
    TextEditingController _incomeController = TextEditingController();
    TextEditingController _savingsController = TextEditingController();
    TextEditingController _ageController = TextEditingController();
    double income = 0.0;
    double mExpenses = 0.0;
    double savings = 0.0;
    int age = 0;

    void dispose() {
      itemName.dispose();
      itemType.dispose();
      itemPrice.dispose();
      _spendingController.dispose();
      _incomeController.dispose();
      _savingsController.dispose();
      _ageController.dispose();
      super.dispose();
    }

    // Items in the list
    final _items = [];

    // The key of the list
    final GlobalKey<AnimatedListState> _key = GlobalKey();

    // Add a new item to the list
    // This is trigger when the floating button is pressed
    void _addItem() {
      _items.insert(
          0,
          Spendings(
              item: itemName.value.text,
              category: itemType.value.text,
              price: double.parse(itemPrice.value.text)));
      _key.currentState!.insertItem(0, duration: Duration(seconds: 1));
      print(_items);
      itemName.clear();
      itemPrice.clear();
      itemType.clear();

      Navigator.pop(context, 'OK');
    }

    // Remove an item
    // This is trigger when the trash icon associated with an item is tapped
    void _removeItem(int index) {
      _key.currentState!.removeItem(
        index,
        (_, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: const Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              color: Colors.red,
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                title: Text("Deleted", style: TextStyle(fontSize: 24)),
              ),
            ),
          );
          ;
        },
      );

      _items.removeAt(index);
    }

    return Scaffold(
      backgroundColor: Colors.green[50],
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('Expenses Monitor'),
        backgroundColor: const Color(0xFF2CDB30),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Text('Expenses List',
                style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 460,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Container(
                  child: ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, //Center Row contents horizontally,
                      children: [
                        const AutoSizeText(
                          'Name',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                        ),
                        Container(
                          width: 70,
                          child: const Center(
                              child: AutoSizeText('Type', maxLines: 1)),
                        ),
                      ],
                    ),
                    trailing: const AutoSizeText(
                      'Price',
                      maxLines: 1,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  height: 0,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Expanded(
                  child: Card(
                    child: AnimatedList(
                      key: _key,
                      initialItemCount: 0,
                      itemBuilder: (_, index, animation) {
                        return SizeTransition(
                          key: UniqueKey(),
                          sizeFactor: animation,
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, //Center Row contents horizontally,
                              children: [
                                AutoSizeText(
                                  _items[index].item,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                ),
                                Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(100))),
                                  child: Center(
                                      child: AutoSizeText(
                                          _items[index].category,
                                          maxLines: 1)),
                                ),
                              ],
                            ),
                            trailing: AutoSizeText(
                              '₱' + _items[index].price.toString(),
                              maxLines: 1,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 20, 40, 10),
            child: Row(
              children: const [
                Expanded(
                    child: AutoSizeText('Total: ',
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
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 70, 30, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.zero),
                child: const Icon(Icons.add),
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Add Item (Monthly Expense)'),
                    content: Container(
                      height: 200,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: itemName,
                              decoration: const InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(),
                                hintText: 'ex. Globe/Smart/BDO/Food',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: itemType,
                              decoration: const InputDecoration(
                                labelText: 'Type',
                                border: OutlineInputBorder(),
                                hintText: 'ex. Food/Water Bill/Electric Bill',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: itemPrice,
                              decoration: const InputDecoration(
                                labelText: 'Price',
                                border: OutlineInputBorder(),
                                hintText: 'ex. 1000 / 100/ 10',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: _addItem,
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
    );
  }
}
*/
/*Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('Monitor'),
        backgroundColor: const Color(0xFF2CDB30),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '''
              Input your monthly expenses,savings, income, and age here.

              ''',
            ),
            SizedBox(
              width: 290,
              child: TextField(
                controller: _spendingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
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
                decoration: const InputDecoration(
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
                decoration: const InputDecoration(
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
                decoration: const InputDecoration(
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
            CalcBrain calcu = CalcBrain(
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

     */
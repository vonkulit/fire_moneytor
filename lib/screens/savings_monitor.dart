// ignore_for_file: avoid_print
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fire_moneytor/functions/calcbrain.dart';
import 'package:fire_moneytor/screens/result_screen.dart';
import 'package:fire_moneytor/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:fire_moneytor/functions/spending_construct.dart';

class SavingMonitorScreen extends StatefulWidget {
  const SavingMonitorScreen({Key? key}) : super(key: key);

  @override
  _SavingMonitorScreenState createState() => _SavingMonitorScreenState();
}

class _SavingMonitorScreenState extends State<SavingMonitorScreen> {
  final itemName = TextEditingController();
  final itemType = TextEditingController();
  final itemPrice = TextEditingController();

  void dispose() {
    itemName.dispose();
    itemType.dispose();
    itemPrice.dispose();
    super.dispose();
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
              title: Center(
                  child: Text(
                "Removed",
                style: TextStyle(color: Colors.white),
              )),
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

  Future<bool> customBackButton() async {
    if (isSwitch) {
      setState(() {
        isSwitch = !isSwitch;
        for (int i = 0; i < _items.length; i++) {
          paints[i].checkbox = !paints[i].checkbox;
          paints[i].selected = false;
        }
        _number.clear();
        print(_number);
      });
    } else {
      return true;
    }

    print("Backbutton Recognized");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: customBackButton,
      child: Scaffold(
        backgroundColor: Colors.green[50],
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text(
            'Monitoring',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
          ),
          backgroundColor: !isSwitch ? const Color(0xFF2CDB30) : Colors.red,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Text('Savings List',
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
                            maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            width: 70,
                            child: const Center(
                                child: AutoSizeText(
                              'Type',
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                      trailing: Container(
                        width: 60,
                        child: const AutoSizeText(
                          'Price',
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
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
                              tileColor:
                                  paints[index].selected ? Colors.grey : null,
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
                                  Container(
                                    width: 150,
                                    child: AutoSizeText(
                                      _items[index].item,
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                    ),
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
                                    child: AutoSizeText(
                                      _items[index].category,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
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
                                      paints[index].selected =
                                          !paints[index].selected;
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
                                print("Selected: " +
                                    paints[index].selected.toString());
                                print("Vsisible: " +
                                    paints[index].checkbox.toString());
                              },
                              onLongPress: () {
                                setState(() {
                                  _number.clear();
                                  isSwitch = !isSwitch;
                                  for (int i = 0; i < _items.length; i++) {
                                    paints[i].checkbox = !paints[i].checkbox;
                                    paints[i].selected = false;
                                  }

                                  if (paints[index].checkbox) {
                                    paints[index].selected = true;
                                    _number.add(index);
                                    print(_number);
                                  }
                                });

                                print("Selected: " +
                                    paints[index].selected.toString());
                                print("Vsisible: " +
                                    paints[index].checkbox.toString());
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
                            title: const Text('Add Savings/Investment'),
                            content: Container(
                              height: 200,
                              width: 150,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 55,
                                    child: TextField(
                                      controller: itemName,
                                      decoration: const InputDecoration(
                                        labelText: 'Name',
                                        border: OutlineInputBorder(),
                                        hintText: 'ex. Investment/Bank Name',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 55,
                                    child: TextField(
                                      controller: itemType,
                                      decoration: const InputDecoration(
                                        labelText: 'Type',
                                        border: OutlineInputBorder(),
                                        hintText: 'ex. Investment or Savings',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 55,
                                    child: TextField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      keyboardType: TextInputType.number,
                                      controller: itemPrice,
                                      decoration: const InputDecoration(
                                        labelText: 'Amount Saved',
                                        border: OutlineInputBorder(),
                                        hintText: 'ex. 10 / 100 / 1000',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                  itemName.clear();
                                  itemPrice.clear();
                                  itemType.clear();
                                },
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
      ),
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

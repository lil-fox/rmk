import 'package:flutter/material.dart';
import 'package:rmk/pages/goods.dart';
//import 'package:intl/intl.dart';
import '../../appbar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class InventarisationDoc extends StatefulWidget {
  String docNumber = "";
  InventarisationDoc(String docNumber, {Key? key}) : super(key: key) {
    this.docNumber = docNumber;
  }

  @override
  State<InventarisationDoc> createState() => _InventarisationDocState();
}

class _InventarisationDocState extends State<InventarisationDoc> {
  String _date = "";
  String _hederTitle = "Шапка";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: MainAppBar(),
      body: Container(
        child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(_hederTitle),
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 10),
                        child: Text("Номер: " + widget.docNumber,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )
                    ]),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: TextButton(
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2018, 3, 5),
                                  //maxTime: DateTime(2019, 6, 7),
                                  onChanged: (date) {}, onConfirm: (date) {
                                setState(() {
                                  _date = date.toString().split(" ")[0];
                                });
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.ru);
                            },
                            child: Text(
                              "Дата: $_date",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ]),
                    Row(children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 30, top: 10),
                        child: Text("Автор: " "qwerty",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ]),
                  ],
                  onExpansionChanged: (expanded) {
                    setState(() {
                      if (expanded) {
                        _hederTitle = "";
                      } else {
                        _hederTitle = "Шапка";
                      }
                    });
                  },
                  backgroundColor: Theme.of(context).primaryColor,
                  collapsedBackgroundColor: Theme.of(context).primaryColor,
                  collapsedIconColor: Colors.white,
                ),
                /*  Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text("Номер: " + widget.docNumber,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  )
                ]),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: TextButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2018, 3, 5),
                              //maxTime: DateTime(2019, 6, 7),
                              onChanged: (date) {}, onConfirm: (date) {
                            setState(() {
                              _date = date.toString().split(" ")[0];
                            });
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.ru);
                        },
                        child: Text(
                          "Дата: $_date",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  )
                ]),
                Row(children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 10),
                    child: Text("Автор: " "qwerty",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ]),
               */
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Expanded(
                      //padding: const EdgeInsets.only(top: 30),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GoodsTable().showGoods())),
                ]),
              ],
            )),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.remove),
        ),
        const SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ]),
    );
  }
}

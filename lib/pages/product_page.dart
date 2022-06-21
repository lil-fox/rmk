import 'package:flutter/material.dart';
import 'package:rmk/appbar.dart';

import '../domain/product.dart';

class ProductItemPage extends StatefulWidget {
  String _title = "";
  String _titleOld = "";
  bool _new = false;
  int _index = -1;
  ProductItemPage(int index, {Key? key, title = "", create = false})
      : super(key: key) {
    _title = title;
    _titleOld = title;
    _new = create;
    _index = index;
  }

  @override
  State<ProductItemPage> createState() => _ProductItemPageState();
}

class _ProductItemPageState extends State<ProductItemPage> {
  final TextEditingController _titleController = TextEditingController();

  String dropdownValue = 'шт';
  List<String> items = ["кг", "шт"];
  @override
  Widget build(BuildContext context) {
    _titleController.text = widget._title;

    return Scaffold(
        appBar: MainAppBar(),
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          child: Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: const Padding(
                      child: Text(
                        "Назва:",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.only(top: 24.0, left: 10),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.50,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder: null),
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      //textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      onChanged: (s) {
                        widget._title = _titleController.text;
                      },
                    ),
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: const Padding(
                      child: Text(
                        "Одиниці виміру:",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.only(top: 24.0, left: 10),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.50,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Theme.of(context).primaryColor,
                        ),
                        child: DropdownButton(
                          value: dropdownValue,
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      ))
                ]),
          ]),
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.topLeft,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (widget._new) {
              Map data = {
                "index": widget._index,
                "product": Product(
                    title: _titleController.text,
                    uuid: "0",
                    price: 10,
                    selfPrice: 5)
              };
              Navigator.pop(context, data);
            } else if (widget._title != widget._titleOld) {
              Map data = {
                "index": widget._index,
                "product": Product(
                    title: _titleController.text,
                    uuid: "0",
                    price: 10,
                    selfPrice: 5)
              };
              widget._titleOld = widget._title;
              Navigator.pop(context, data);
            }
          },
          child: const Icon(Icons.save),
        ));
  }
}

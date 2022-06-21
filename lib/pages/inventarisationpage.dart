import 'package:flutter/material.dart';
import 'package:rmk/appbar.dart';
import 'package:rmk/domain/inventarisation.dart';
import 'package:rmk/drawer.dart';
import 'package:rmk/pages/documents/inventarisation.dart';

class InventarisationPage extends StatefulWidget {
  InventarisationPage({Key? key}) : super(key: key);

  List docs = [
    Inventarisation(number: "001", date: "", author: "test_user", goods: []),
    Inventarisation(number: "002", date: "", author: "test_user", goods: []),
    Inventarisation(number: "003", date: "", author: "test_user", goods: []),
  ];

  @override
  State<InventarisationPage> createState() => _InventarisationPageState();
}

class _InventarisationPageState extends State<InventarisationPage> {
  final _scrollController = ScrollController();

  Widget _showDocs() {
    return ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: widget.docs.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2.0,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Container(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
              child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: Text(
                    widget.docs[index].number,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.titleMedium?.color,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                InventarisationDoc(widget.docs[index].number)));
                  },
                  onLongPress: () {
                    showAlertDialog(context, index);

                    setState(() {});
                  }),
            ),
          );
        });
  }

  showAlertDialog(BuildContext context, int index) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: const Text("Відмінити"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: const Text("Видалити"),
      onPressed: () {
        Navigator.of(context).pop();
        widget.docs.removeAt(index);
        setState(() {});
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Видалення документа"),
      content: const Text(
        "Видалити єлемент?",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: MainAppBar(title: "Інвентаризація"),
      drawer: MainDrawer(),
      body: _showDocs(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              String docNumber = (1 + widget.docs.length).toString();
              docNumber = "0" * (4 - docNumber.length) + docNumber;

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => InventarisationDoc(docNumber)),
                //(Route<dynamic> route) => false,
              );
              widget.docs.add(
                Inventarisation(
                    number: docNumber,
                    date: "",
                    author: "test_user",
                    goods: []),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

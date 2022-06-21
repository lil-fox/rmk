import 'package:flutter/material.dart';
import 'package:rmk/pages/product_page.dart';

class ProductCard extends StatefulWidget {
  final String _title;
  final String _article;
  final double _price;
  final int _index;
  final IntCallback intCallback;
  final MapCallback mapCallback;
  const ProductCard(this._title, this._article, this._price, this._index,
      this.intCallback, this.mapCallback,
      {Key? key})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

typedef IntCallback = void Function(int val);
typedef MapCallback = void Function(Map data);

class _ProductCardState extends State<ProductCard> {
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
        widget.intCallback(index);
        //widget.products.removeAt(index);
        setState(() {});
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Видалення номенклатури"),
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
    return Card(
      color: const Color.fromARGB(228, 87, 114, 150),
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        title: Row(
          children: [
            Text(
              widget._title,
              style: TextStyle(
                  color: Theme.of(context).textTheme.titleMedium?.color,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              widget._price.toString(),
              style: TextStyle(
                  color: Theme.of(context).textTheme.titleMedium?.color,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        onTap: () async {
          final Map data = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ProductItemPage(
                      widget._index,
                      title: widget._title,
                    )),
          );
          widget.mapCallback(data);
          setState(() {});
        },
        onLongPress: () {
          showAlertDialog(context, widget._index);

          setState(() {});
        },
      ),
    );
  }
}

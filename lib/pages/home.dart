import 'package:flutter/material.dart';
import 'package:rmk/appbar.dart';
import '../domain/product.dart';
import '../drawer.dart';

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(userName: widget.userName.toString()),
        backgroundColor: Theme.of(context).primaryColor,
        appBar: MainAppBar(title: "..."),
        body: const Text("..."));
  }
}

class GoodsTable extends StatelessWidget {
  final goods = <Product>[
    Product(
        title: 'Конструктор',
        uuid: "001",
        price: 100,
        selfPrice: 50,
        count: 1000),
    Product(title: 'Пазл', uuid: "002", price: 20, selfPrice: 15, count: 100),
    Product(title: 'Машинка', uuid: "003", price: 150, selfPrice: 60, count: 0),
    Product(title: 'Кукла', uuid: "004", price: 30, selfPrice: 15, count: 20),
  ];

  GoodsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _tableHeaderCell(text) {
      return TableCell(
          child: Container(
        color: const Color.fromARGB(228, 64, 98, 141),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
                child: Text(
              text,
              textScaleFactor: 1.3,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ))),
      ));
    }

    Widget _titleCell(title) {
      return TableCell(
        child: Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(right: 10, left: 5),
            child: Text(
              title,
              textScaleFactor: 1.3,
            )),
      );
    }

    Widget _numberCell(number) {
      return TableCell(
        child: Container(
            color: Colors.white,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              "$number",
              textScaleFactor: 1.3,
            )),
      );
    }

    List<Widget> _tableHeader() {
      return [
        _tableHeaderCell("Цена"),
        _tableHeaderCell("Кол-во"),
        _tableHeaderCell("Наименование"),
      ];
    }

    List<TableRow> _fillGoods(goods) {
      return [
        for (Product item in goods)
          TableRow(children: [
            _numberCell(item.price),
            _numberCell(item.count),
            _titleCell(item.title),
          ])
      ];
    }

    return Container(
      child: Scaffold(
        //drawer: MainDrawer(),
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: Table(
              textDirection: TextDirection.rtl,
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.all(width: 2.0, color: Colors.black),
              columnWidths: const {
                0: FixedColumnWidth(100),
                1: FixedColumnWidth(100),
                2: FlexColumnWidth()
              },
              children: [
                TableRow(
                  children: _tableHeader(),
                ),
                ..._fillGoods(goods)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  String userName;
  static const route = "/intermediate";
  HomePage({Key? key, required this.userName}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class GoodsList extends StatelessWidget {
  final goods = <Product>[
    Product(
        title: 'Конструктор',
        uuid: "001",
        price: 100,
        selfPrice: 50,
        count: 1000),
    Product(title: 'Пазл', uuid: "002", price: 20, selfPrice: 15, count: 100),
    Product(title: 'Машинка', uuid: "003", price: 150, selfPrice: 60, count: 0),
    Product(title: 'Кукла', uuid: "004", price: 30, selfPrice: 15, count: 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: goods.length,
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
                    goods[index].title,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.titleMedium?.color,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

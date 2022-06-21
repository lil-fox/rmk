import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:rmk/pages/product_card.dart';
import '../domain/product.dart';
import '../drawer.dart';
import '../appbar.dart';
import 'product_page.dart';

class _GoodsPageState extends State<GoodsPage> {
  Widget showGoods() {
    return ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return ProductCard(
              widget.products[index].title,
              "",
              widget.products[index].price,
              index,
              (value) => setState(() {
                    widget.products.removeAt(value);
                  }),
              (data) => setState(() {
                    if (data["index"] > -1) {
                      widget.products.replaceRange(
                          data["index"], data["index"] + 1, [data["product"]]);
                    }
                  }));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      appBar: MainAppBar(
        title: "Номенклатура",
      ),
      body: showGoods(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Map data = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ProductItemPage(
                      -1,
                      create: true,
                    )),
          );
          print("P");
          setState(() {
            // ignore: unnecessary_null_comparison
            if (data != null) {
              if (data["index"] == -1) {
                widget.products.add(data["product"]);
              }
            }
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
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
    Product(title: 'Лялька', uuid: "004", price: 30, selfPrice: 15, count: 20),
  ];
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
      _tableHeaderCell("Ціна"),
      _tableHeaderCell("Кіл-ть"),
      _tableHeaderCell("Назва"),
    ];
  }

  List<TableRow> _fillGoods(goods) {
    return [
      for (Product item in goods)
        TableRow(
          children: [
            _numberCell(item.price),
            _numberCell(item.count),
            _titleCell(item.title),
          ],
        )
    ];
  }

  Widget showGoods() {
    return Table(
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
    );
  }

  Future<http.Response> deletePost(int id) {
    return http.get(Uri.parse('http://api_blog_ru.local/posts/$id'));

    /* return http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    ); */
  }

  int _id = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      //drawer: MainDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(0),
          child: showGoods(),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          deletePost(_id);
          _id += 1;
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}

class GoodsPage extends StatefulWidget {
  String userName;

  GoodsPage({Key? key, this.userName = ""}) : super(key: key);

  @override
  State<GoodsPage> createState() => _GoodsPageState();

  List products = [
    Product(
        title: 'Конструктор',
        uuid: "001",
        price: 100,
        selfPrice: 50,
        count: 100),
    Product(title: 'Пазл', uuid: "002", price: 20, selfPrice: 15, count: 100),
    Product(title: 'Машинка', uuid: "003", price: 150, selfPrice: 60, count: 0),
    Product(title: 'Кукла', uuid: "004", price: 30, selfPrice: 15, count: 20),
  ];
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

  Widget showGoods() {
    return ListView.builder(
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: goods.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2.0,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(50, 65, 85, 0.9)),
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
      ),
    );
  }
}

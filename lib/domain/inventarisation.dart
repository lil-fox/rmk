import 'product.dart';

class Inventarisation {
  String number;
  String date;
  String author;
  List<Product> goods;

  Inventarisation(
      {required this.number,
      required this.date,
      required this.author,
      required this.goods});
}

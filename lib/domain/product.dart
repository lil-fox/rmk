class Product {
  String title;
  String uuid;
  String atrticle;
  int count;
  double price;
  double selfPrice;

  Product(
      {required this.title,
      required this.uuid,
      this.atrticle = '',
      this.count = 0,
      required this.price,
      required this.selfPrice});
}

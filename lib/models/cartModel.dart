class Cartmodel {
  final String name, price, image;
   int totalPrice, quantity;

  Cartmodel({
    required this.name,
    required this.price,
    required this.image,
    required this.totalPrice,
    required this.quantity,
  });
}


class CartStorage {
  static List<Cartmodel> cartList = [];
}



class FruitModel {
  final String image;
  final String name;
  final String price;

  FruitModel({
    required this.image,
    required this.name,
    required this.price,
  });

  factory FruitModel.fromJson(Map<String, dynamic> json) {
    return FruitModel(
      image: json['image'],
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'price': price,
    };
  }
}





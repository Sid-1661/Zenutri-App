class Favourite {
  final String title, image, productId;
  final double price;
  final int id;
  int quantity = 1;

  Favourite(
    this.title,
    this.image,
    this.productId,
    this.price,
    this.id,
  );

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return Favourite(
      json['title'],
      json['image'],
      json['productId'],
      json['price'],
      json['id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'productId': productId,
      'price': price,
      'id': id,
    };
  }
}

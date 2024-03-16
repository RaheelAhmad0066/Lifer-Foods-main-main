class CartItem {
  CartItem({
    required this.productId,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    this.salePrice,
    this.discount,
    this.name = '',
    this.image = 'assets/images/food1.jpeg',
  });

  int productId;
  int quantity;
  double price;
  double totalPrice;
  double? discount;
  String name;
  String image;
  double? salePrice;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        productId: json["product_id"],
        quantity: json["quantity"],
        price: json["price"],
        salePrice: json["saleprice"],
        totalPrice: json["total_price"],
        discount: json["discount"] ?? 0.0,
        name: json["name"] ?? '',
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
        "price": price,
        "saleprice": salePrice,
        "total_price": totalPrice,
        "discount": discount ?? 0.0,
        "name": name,
        "image": image,
      };
}

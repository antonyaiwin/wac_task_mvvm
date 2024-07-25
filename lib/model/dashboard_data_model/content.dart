class Content {
  String? title;
  String? imageUrl;
  String? sku;
  String? productName;
  String? productImage;
  int? productRating;
  String? actualPrice;
  String? offerPrice;
  String? discount;

  Content({
    this.title,
    this.imageUrl,
    this.sku,
    this.productName,
    this.productImage,
    this.productRating,
    this.actualPrice,
    this.offerPrice,
    this.discount,
  });

  factory Content.fromMap(Map<String, dynamic> json) => Content(
        title: json["title"],
        imageUrl: json["image_url"],
        sku: json["sku"],
        productName: json["product_name"],
        productImage: json["product_image"],
        productRating: json["product_rating"],
        actualPrice: json["actual_price"],
        offerPrice: json["offer_price"],
        discount: json["discount"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "image_url": imageUrl,
        "sku": sku,
        "product_name": productName,
        "product_image": productImage,
        "product_rating": productRating,
        "actual_price": actualPrice,
        "offer_price": offerPrice,
        "discount": discount,
      };
}

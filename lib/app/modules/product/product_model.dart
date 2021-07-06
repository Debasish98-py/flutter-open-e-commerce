import 'dart:convert';


Product productFromMap(String str) => Product.fromMap(json.decode(str));

String productToMap(Product data) => json.encode(data.toMap());

class Product {
  Product({
    this.id,
    this.uniId,
    this.name,
    this.shortName,
    this.price,
    this.imageUrl,
    this.description,
    this.manufacturer,
    this.inStock,
    this.discount,
    this.keywords,
  });

  String id;
  String uniId;
  String name;
  String shortName;
  num price;
  String imageUrl;
  String description;
  String manufacturer;
  bool inStock;
  num discount;
  List keywords;


  Product copyWith({
    String id,
    String uniId,
    String name,
    String shortName,
    num price,
    String imageUrl,
    String description,
    String manufacturer,
    bool inStock,
    num discount,
    List keywords,
  }) =>
      Product(
        id: id ?? this.id,
        uniId: uniId ?? this.uniId,
        name: name ?? this.name,
        shortName: shortName ?? this.shortName,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
        manufacturer: manufacturer ?? this.manufacturer,
        inStock: inStock ?? this.inStock,
        discount: discount ?? this.discount,
        keywords: keywords ?? this.keywords,
      );

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        uniId: json["uniId"] == null ? null : json["uniId"],
        name: json["name"] == null ? null : json["name"],
        shortName: json["shortName"] == null ? null : json["shortName"],
        price: json["price"] == null ? null : json["price"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        description: json["description"] == null ? null : json["description"],
        manufacturer:
            json["manufacturer"] == null ? null : json["manufacturer"],
        inStock: json["inStock"] == null ? null : json["inStock"],
        discount: json["discount"] == null ? null : json["discount"],
        keywords: json["keywords"] == null ? null : json["keywords"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "uniId": uniId == null ? null : uniId,
        "name": name == null ? null : name,
        "shortName": shortName == null ? null : shortName,
        "price": price == null ? null : price,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "description": description == null ? null : description,
        "manufacturer": manufacturer == null ? null : manufacturer,
        "inStock": inStock == null ? null : inStock,
        "discount": discount == null ? null : discount,
        "keywords": keywords == null ? null : keywords,
      };
}

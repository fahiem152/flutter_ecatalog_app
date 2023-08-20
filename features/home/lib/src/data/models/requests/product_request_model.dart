// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductRequestModel {
  String title;
  int price;
  String description;
  int categoryId;
  List<String> images;

  ProductRequestModel({
    required this.title,
    required this.price,
    required this.description,
    this.categoryId = 1,
    this.images = const [
      "https://cdns.klimg.com/merdeka.com/i/w/news/2021/10/21/1366484/540x270/10-pemandangan-keren-di-indonesia-wajib-dikunjungi-langsung.jpg"
    ],
  });

  factory ProductRequestModel.fromJson(String str) =>
      ProductRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductRequestModel.fromMap(Map<String, dynamic> json) =>
      ProductRequestModel(
        title: json["title"],
        price: json["price"],
        description: json["description"],
        categoryId: json["categoryId"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "price": price,
        "description": description,
        "categoryId": categoryId,
        "images": List<dynamic>.from(images.map((x) => x)),
      };

  ProductRequestModel copyWith({
    String? title,
    int? price,
    String? description,
    int? categoryId,
    List<String>? images,
  }) {
    return ProductRequestModel(
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      images: images ?? this.images,
    );
  }
}

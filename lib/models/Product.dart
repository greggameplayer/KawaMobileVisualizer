import 'dart:convert';
import 'package:kawa_mobile_visualizer/models/Details.dart';

List<Product> productsFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Product {
  String? createdAt;
  String? name;
  Details? details;
  int? stock;
  String? id;

  Product({this.createdAt, this.name, this.details, this.stock, this.id});

  Product.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    details =
    json['details'] != null ? new Details.fromJson(json['details']) : null;
    stock = json['stock'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    data['stock'] = this.stock;
    data['id'] = this.id;
    return data;
  }
}
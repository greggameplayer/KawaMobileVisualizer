import 'dart:convert';
import 'package:kawa_mobile_visualizer/models/Address.dart';
import 'package:kawa_mobile_visualizer/models/Company.dart';
import 'package:kawa_mobile_visualizer/models/Orders.dart';
import 'package:kawa_mobile_visualizer/models/Profile.dart';


List<Customer> customerFromJson(String str) => List<Customer>.from(json.decode(str).map((x) => Customer.fromJson(x)));
String customerToJson(List<Customer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Customer {
  String? createdAt;
  String? name;
  String? username;
  String? firstName;
  String? lastName;
  Address? address;
  Profile? profile;
  Company? company;
  String? id;
  String? email;
  List<Orders>? orders;

  Customer(
      {this.createdAt,
        this.name,
        this.username,
        this.firstName,
        this.lastName,
        this.address,
        this.profile,
        this.company,
        this.id,
        this.email,
        this.orders});

  Customer.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    id = json['id'];
    email = json['email'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    data['id'] = this.id;
    data['email'] = this.email;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
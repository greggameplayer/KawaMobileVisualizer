import 'package:flutter/cupertino.dart';
import 'package:kawa_mobile_visualizer/models/Product.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'connection.dart';

Future<List<Product>> getProductsFromMock(BuildContext context) async{
  final url = Uri.parse('https://vendor-mspr4.gregsvc.fr/api/v1/products');

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  checkTokenIsValid(context, token!);

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };

  var response = await http.get(url, headers: requestHeaders);
  if (response.statusCode == 200) {
    var json = response.body;
    return productsFromJson(json);
  } else {
    return [];
  }
}

Future<Product> getOneProductFromMock(BuildContext context, String id) async{
  final url = Uri.parse('https://vendor-mspr4.gregsvc.fr/api/products/$id');

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  checkTokenIsValid(context, token!);

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };

  var response = await http.get(url, headers: requestHeaders);
  if (response.statusCode == 200) {
    var json = response.body;
    return productFromJson(json);
  } else {
    return throw Exception('No data found') ;
  }
}

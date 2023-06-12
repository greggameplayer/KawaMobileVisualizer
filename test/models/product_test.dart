import 'dart:convert';

import 'package:kawa_mobile_visualizer/models/Product.dart';
import 'package:test/test.dart';
import 'package:kawa_mobile_visualizer/utils/product_helpers.dart';

void main(){
  Product product = getMockProduct();
  test('Product should have a name', (){
    expect(product.name, "Rex Bailey");
    expect(product.id, "1");
    expect(product.stock, 1250);
  });

  Product product2 = Product.fromJson(jsonDecode(getMockProductJson()));
  test('Product should be load from JSON file', (){
    expect(product2.name, "Rex Bailey");
    expect(product2.id, "1");
    expect(product2.stock, 12059);
  });


  Product product3 = productFromJson(getMockProductJson());
  test('Product should be load from JSON file', (){
    expect(product3.name, "Rex Bailey");
    expect(product3.id, "1");
    expect(product3.stock, 12059);
  });

  List<Product> products = productsFromJson(getMockProductsJson());
  test('Product should be load from JSON file', (){
    expect(products.length, 3);
    expect(products[0].name, "Rex Bailey");
    expect(products[0].id, "1");
    expect(products[0].stock, 12059);
  });
}
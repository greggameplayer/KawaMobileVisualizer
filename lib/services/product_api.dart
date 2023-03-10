import 'package:kawa_mobile_visualizer/models/Product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> getProductsFromMock() async{
  final url = Uri.parse('https://615f5fb4f7254d0017068109.mockapi.io/api/v1/products');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var json = response.body;
    return productsFromJson(json);
  } else {
    return [];
  }
}

Future<Product> getOneProductFromMock(String id) async{
  final url = Uri.parse('https://615f5fb4f7254d0017068109.mockapi.io/api/v1/products/' + id);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var json = response.body;
    return productFromJson(json);
  } else {
    return throw Exception('No data found') ;
  }
}

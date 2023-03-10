import 'package:kawa_mobile_visualizer/models/Customer.dart';
import 'package:http/http.dart' as http;


//Just an example
Future<List<Customer>> getCustomersFromAPI() async{
  final url = Uri.parse('https://615f5fb4f7254d0017068109.mockapi.io/api/v1/customers');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var json = response.body;
    return customerFromJson(json);
  } else {
    return [];
  }
}

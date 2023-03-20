

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kawa_mobile_visualizer/models/Customer.dart';
import 'package:kawa_mobile_visualizer/services/customer_save_sqlite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await deleteDb();

  CustomerSave customer = CustomerSave(id: 1, email: "email", token: "token");
  await insertUserinSqlite(customer);

  var customers = await getCustomersInDb(customer);
  test('Should return a list of one CustomerSave', (){
    expect(customers.length, 1);
    expect(customers[0].id, 1);
    expect(customers[0].email, "email");
    expect(customers[0].token, "token");
  });

  var customer1 = CustomerSave(id: 1, email: "victormarit.95@gmail.com", token: "1234566Kafetoken");
  updateUserinSqlite(customer1);
  var customerIdentifiedById = await getCustomerInDbById(customer.id);
  test('Should return CustomerSave updated', (){
    expect(customerIdentifiedById.id, 1);
    expect(customerIdentifiedById.email, "victormarit.95@gmail.com");
    expect(customerIdentifiedById.token, "1234566Kafetoken");
  });


  await deleteUserinSqlite(customer1);
  customers = await getCustomersInDb(customer);
  test('Should return an empty list of CustomerSave', (){
    expect(customers.length, 0);
  });

  await deleteDb();
}

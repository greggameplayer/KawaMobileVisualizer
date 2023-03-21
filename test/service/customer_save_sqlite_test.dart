import 'package:flutter/material.dart';
import 'package:kawa_mobile_visualizer/models/Customer.dart';
import 'package:kawa_mobile_visualizer/services/customer_save_sqlite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test/test.dart';


void sqfliteTestInit() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
}


Future main() async {
  sqfliteTestInit();
  WidgetsFlutterBinding.ensureInitialized();



  CustomerSave customerSave = CustomerSave(id: 1, email: "email", token: "token");
  test("Customer should have been initialized", () => {
    expect(customerSave.id, 1),
    expect(customerSave.email, "email"),
    expect(customerSave.token, "token")
  });

  insertUserinSqlite(customerSave);

  List<CustomerSave> customers = await getCustomersInDb();
  test("Should return return a list of one CustomerSave", () => {
    expect(customers.length, 1),
    expect(customers[0].id, 1),
    expect(customers[0].email, "email"),
    expect(customers[0].token, "token")
  });

  CustomerSave customerSave1 = CustomerSave(id: 1, email: "mspr@gmail.com", token: "faketoken1");
  updateUserinSqlite(customerSave1);

  CustomerSave customerSave2 = await getCustomerInDbById(1);
  test("Should have update customerSave in db", () => {
    expect(customerSave2.id, 1),
    expect(customerSave2.email, "mspr@gmail.com"),
    expect(customerSave2.token, "faketoken1"),
  });

  deleteUserinSqlite(customerSave2);

  List<CustomerSave> customers2 = await getCustomersInDb();
  test("Should return return a list of zero CustomerSave", () => {
    expect(customers2.length, 0),
  });

}
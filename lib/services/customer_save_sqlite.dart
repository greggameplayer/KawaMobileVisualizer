import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Customer.dart';

Future<void> insertUserinSqlite(customer) async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'customer.db'),
    onCreate: (db, version) {
      return db.execute('CREATE TABLE customer(id INTEGER PRIMARY KEY, email TEXT, token TEXT)',);
    },
    version: 1,
  );

  Future<void> insertCustomer(CustomerSave customerSave) async {
    final db = await database;
    await db.insert(
      'customer',
      customerSave.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  await insertCustomer(customer);
}

Future<void> updateUserinSqlite(customer) async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'customer.db'),
    onCreate: (db, version) {
      return db.execute('CREATE TABLE customer(id INTEGER PRIMARY KEY, email TEXT, token TEXT)',);
    },
    version: 1,
  );

  Future<void> updateCustomer(CustomerSave customerSave) async {
    final db = await database;
    await db.update(
      'customer',
      customerSave.toMap(),
      where: "id = ?",
      whereArgs: [customerSave.id],
    );
  }

  await updateCustomer(customer);
}

Future<void> deleteUserinSqlite(customer) async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'customer.db'),
    onCreate: (db, version) {
      return db.execute('CREATE TABLE customer(id INTEGER PRIMARY KEY, email TEXT, token TEXT)',);
    },
    version: 1,
  );

  Future<void> deleteCustomer(CustomerSave customerSave) async {
    final db = await database;
    await db.delete(
      'customer',
      where: "id = ?",
      whereArgs: [customerSave.id],
    );
  }

  await deleteCustomer(customer);
}

Future<List<CustomerSave>> getCustomersInDb(customer) async {
  late Future<List<CustomerSave>> customers;
  final database = openDatabase(
    join(await getDatabasesPath(), 'customer.db'),
    onCreate: (db, version) {
      return db.execute('CREATE TABLE customer(id INTEGER PRIMARY KEY, email TEXT, token TEXT)',);
    },
    version: 1,
  );

  Future<List<CustomerSave>> getCustomersInSqlite() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('customer');

    return List.generate(maps.length, (i) {
      return CustomerSave(
        id: maps[i]['id'],
        email: maps[i]['email'],
        token: maps[i]['token'],
      );
    });
  }

  customers =getCustomersInSqlite();
  return customers;
}


Future<CustomerSave> getCustomerInDbById(int id) async {
  late Future<CustomerSave> customer;
  final database = openDatabase(
    join(await getDatabasesPath(), 'customer.db'),
    onCreate: (db, version) {
      return db.execute('CREATE TABLE customer(id INTEGER PRIMARY KEY, email TEXT, token TEXT)',);
    },
    version: 1,
  );

  Future<CustomerSave> getOneCustomerInSqlite(id) async {
    final db = await database;
    final List<Map<String, dynamic>> map = await db.rawQuery('SELECT * from customer where id = $id');

    return CustomerSave(
      id: map[0]['id'],
      email: map[0]['email'],
      token: map[0]['token'],
    );
  }

  customer = getOneCustomerInSqlite(id);
  return customer;
}


Future<void> deleteDb() async{
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'customer.db');
  await deleteDatabase(path);
}

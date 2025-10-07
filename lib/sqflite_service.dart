import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';
import 'package:myform/product.model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDB {
  // Creating a NEW Database, OR Creating it if it doesn't exist
  static Future<Database> createDoc() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'productDB.db');

    // open the database
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
          'CREATE TABLE ProductDB (id INTEGER PRIMARY KEY, customerName TEXT, productPrice REAL, productID TEXT)',
        );
      },
    );
    return database;
  }

  // Create a doc
  static Future<bool> insertDoc({required ProductModel prod}) async {
    try {
      final db = await createDoc();
      int id1 = await db.rawInsert(
        // 'ProductDB',
        // prod.toJson()
        'INSERT INTO ProductDB(customerName, productPrice, productID) VALUES("${prod.customerName.toString()}", ${prod.productPrice}, "${prod.productID.toString()}")',
      );
      // int id1 = await db.insert(
      //   'ProductDB',
      //   prod.toJson()
      //   // 'INSERT INTO ProductDB(customerName, productPrice, productID) VALUES(${prod.customerName.toString()}, ${prod.productPrice}, ${prod.productID.toString()})',
      // );
      Logger().i(jsonEncode('Saved successfully'));
      return true;
    } catch (e) {
      Logger().i(jsonEncode(e.toString()));

      return false;
    }
  }

  // var db = await openDatabase('productDB.db');

  // await db.close();

  // Delete a doc

  // Read a doc
  static Future<List<ProductModel>?> fetchProd() async {
    try {
      final db = await createDoc();
      List<Map<String, dynamic>> list = await db.rawQuery(
        'SELECT * FROM ProductDB',
      );
      Logger().i(jsonEncode(list));
      return list.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      print(e);
      Logger().i(jsonEncode(e.toString()));
    }
    // [] or null
  }

  // Modify a doc
}

final fetchedProdProvider = FutureProvider.autoDispose<List<ProductModel>?>((
  ref,
) async {
  // []
  // or
  // List<null>
  final fetch = LocalDB.fetchProd;
  return fetch();
});

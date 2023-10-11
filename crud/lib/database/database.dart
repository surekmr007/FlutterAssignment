import 'dart:async';

import 'package:crud/model/users.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

 dynamic? database;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'Users_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    },
    version: 1,
  );

  Future<void> updateUsers(Users users) async {
    final db = await database;
    await db.update(
      'users',
      users.toMap(),
      where: 'id = ?',
      whereArgs: [users.id],
    );
  }

  Future<void> deleteUsers(int id) async {
    final db = await database;
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // var fido = Users(
  //   id: 0,
  //   name: 'Fido',
  //   age: 35,
  //   mobile: 0712345678,
  //   email: '<EMAIL>',
  // );

  // await insertUsers(fido);

  print(await users()
  ); 

  // fido = Users(
  //   id: fido.id,
  //   name: fido.name,
  //   age: fido.age + 7, mobile: 0712345678, email: '<EMAIL>',
  // );
  // await updateUsers(fido);

  print(await users()); 

  // await deleteUsers(fido.id);

  print(await users());
}
  Future<void> insertUsers(Users users) async {
    final db = await database;
    await db.insert(
      'users',
      users.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  
  Future<List<Users>> users() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return Users(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
        mobile: maps[i]['mobile'],
        email: maps[i]['email'],
      );
    });
  }
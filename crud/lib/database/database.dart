// DATABASE FILE
import 'dart:async';
import 'package:crud/model/users.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

dynamic? database;

Future<void> insertUsers(Users users) async {
  final db = await database;
  await db.insert(
    'users',
    users.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

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

Future<List<Users>> fetchUsers() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('users');
  return List.generate(maps.length, (i) {
    return Users(
      id: maps[i]['id'],
      name: maps[i]['name'],
      age: maps[i]['age'], email: maps[i]['email'],
    );
  });
}

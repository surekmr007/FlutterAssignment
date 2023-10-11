import 'package:crud/database/database.dart';
import 'package:crud/model/users.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  Future<void> init() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'Users_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, email TEXT)',
        );
      },
      version: 1,
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.init();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                var fido = Users(
                  id: 1,
                  name: 'Fido',
                  age: 35,
                  email: 'surekmr007@gmail.com',
                );
                insertUsers(fido);
              },
              child: Text('Insert'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                var fido = Users(
                  id: 1, 
                  name: 'Fido',
                  age: 42,
                  email: 'ysdbyfvh@jndfh.cindf',
                );
                updateUsers(fido);
              },
              child: Text('Update'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                deleteUsers(1);
              },
              child: Text('Delete'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () async {
                final users = await fetchUsers();
                print(users);
              },
              child: Text('Read'),
            ),
          ],
        ),
      ),
    );
  }
}
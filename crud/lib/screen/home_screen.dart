import 'package:crud/model/users.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:crud/database/database.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {

  // Future<void> insertUsers(Users users) async {
  //   final db = await database;
  //   await db.insert(
  //     'users',
  //     users.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }

    
    return Center(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                var fido = Users(
                  id: 0,
                  name: 'Fido',
                  age: 35,
                  mobile: 0712345678,
                  email: '<EMAIL>',
                );
                insertUsers(fido);
                print(users());
              },
              child: Text('Insert')),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(onPressed: () {}, child: Text('Update')),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(onPressed: () {}, child: Text('Delete')),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(onPressed: () {}, child: Text('Read')),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final storage = FlutterSecureStorage();
  final apiKey = dotenv.env['API_KEY'];
  // Function to save the secret token 
  Future<void> _saveToken() async {
    await storage.write(key: 'token', value: apiKey);
  }

  // Function to retrieve the secret token
  Future<void> _retrieveToken() async {
    final token = await storage.read(key: 'token');
    print('Secret Token: $token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Secure Storage Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _saveToken,
              child: Text('Save Secret Token'),
            ),
            ElevatedButton(
              onPressed: _retrieveToken,
              child: Text('Retrieve Secret Token'),
            ),
          ],
        ),
      ),
    );
  }
}

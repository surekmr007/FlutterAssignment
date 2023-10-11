import 'package:data_encryption/question1.dart';
import 'package:data_encryption/secure_storage/screen.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:encrypt/encrypt.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final String originalData = "Hello, World!";
  // final String encryptionKey = "ThisIsASecretKey";

  @override
  Widget build(BuildContext context) {
    const plainText = 'Hello World.!';

    final key = Key.fromSecureRandom(32);
    final iv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

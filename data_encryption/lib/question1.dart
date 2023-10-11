import 'package:data_encryption/question2.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:encrypt/encrypt.dart';

class Question1 extends StatelessWidget {
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Encryption Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    sendSensitiveData();
                  },
                  child: Text('click to send data')),
              Text('Original Data: $plainText'),
              Text('Encrypted Data: ${encrypted.base64}'),
              Text('Decrypted Data: $decrypted'),
            ],
          ),
        ),
      ),
    );
  }
}

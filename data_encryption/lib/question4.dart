import 'dart:io';

import 'package:encrypt/encrypt.dart';

void main() {
  final encrypter = Encrypter(AES(Key.fromUtf8('my secret key')));

  // Encrypt the data
  final encryptedData = encrypter.encrypt('my plain text');

  // Save the encrypted data to a file
  final file = File('encrypted_data.txt');
  file.writeAsStringSync(encryptedData.base64);

  // Decrypt the data
  final decryptedData = encrypter.decrypt(encryptedData);

  print(decryptedData); // Prints "my plain text"
}

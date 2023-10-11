import 'dart:convert';

import 'package:data_encryption/utility/utility.dart';
import 'package:http/http.dart' as http;

void sendSensitiveData() async {
  SecureStorageUtil secureStorage = SecureStorageUtil();
  await secureStorage.saveSensitiveData(
      'apiKey', 'https://reqres.in/api/users');
  dynamic apikey = await secureStorage.getSensitiveData('apiKey');
  final url = Uri.parse(apikey);
  final response = await http.post(
    url,
    headers: {
      'Content-type': 'application/json', // Set the appropriate content type
      // Add any additional headers if required
    },
    body: jsonEncode({"name": "morpheus", "job": "leader"}),
  );

  if (response.statusCode == 201) {
    // Successfully sent sensitive data to the server
    print('Data sent successfully.');
    print("sample");
  } else {
    // Handle errors if the request was not successful
    print('Failed to send data. Status code: ${response.statusCode}');
  }
}

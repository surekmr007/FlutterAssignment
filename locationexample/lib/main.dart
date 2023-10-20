import 'package:flutter/material.dart';
import 'package:locationexample/widgets/changeNotification.dart';
import 'package:locationexample/widgets/changeSettings.dart';
import 'package:locationexample/widgets/enableInBackground.dart';
import 'package:locationexample/widgets/getLocation.dart';
import 'package:locationexample/widgets/listenLocation.dart';
import 'package:locationexample/widgets/permission.dart';
import 'package:locationexample/widgets/service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Location Example'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(32),
            child: const Column(children: [
              PermissionStatusWidget(),
              Divider(height: 32),
              ServiceEnabledWidget(),
              Divider(height: 32),
              GetLocationWidget(),
              Divider(height: 32),
              ListenLocationWidget(),
              Divider(height: 32),
              ChangeSettings(),
              Divider(height: 32),
              EnableInBackgroundWidget(),
              Divider(height: 32),
              ChangeNotificationWidget()
            ]),
          ),
        ),
      ),
    );
  }
}

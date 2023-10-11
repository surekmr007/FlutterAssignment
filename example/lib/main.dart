import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

void main() {
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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keyboard Actions Example'),
      ),
      body: KeyboardActions(
        config: KeyboardActionsConfig(
          keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
          nextFocus: true,
          actions: [
            KeyboardActionsItem(
              focusNode: _focusNode,
              toolbarButtons: [
                (node) {
                  return GestureDetector(
                    onTap: () => node.unfocus(),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('CLOSE'),
                    ),
                  );
                },
              ],
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              focusNode: _focusNode,
              decoration: InputDecoration(
                labelText: 'Type here',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Widget on top of the keyboard',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

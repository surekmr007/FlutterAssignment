import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication Success'),
      ),
      body: const Center(
        child: Text('You have successfully authenticated!'),
      ),
    );
  }
}

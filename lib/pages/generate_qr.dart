import 'package:flutter/material.dart';

class GenerateQrPage extends StatelessWidget {
  const GenerateQrPage({Key? key}) : super(key: key);

  static const routeName = '/generate';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR'),
      ),
      body: Text('Hello World'),
    );
  }
}
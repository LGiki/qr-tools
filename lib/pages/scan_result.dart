import 'package:flutter/material.dart';

class ScanResultPage extends StatelessWidget {
  const ScanResultPage({Key? key}) : super(key: key);

  static const routeName = '/scan_result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Result'),
      ),
      body: Text('ScanResultPage'),
    );
  }
}
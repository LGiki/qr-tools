import 'package:flutter/material.dart';
import 'package:qr_tools/pages/about.dart';
import 'package:qr_tools/pages/generate_qr.dart';
import 'package:qr_tools/pages/home.dart';
import 'package:qr_tools/pages/scan_qr.dart';
import 'package:qr_tools/pages/scan_result.dart';
import 'package:qr_tools/pages/settings.dart';

void main() {
  runApp(const QrToolsApp());
}

class QrToolsApp extends StatelessWidget {
  const QrToolsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Tools',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) => const HomePage(),
        "/scan": (BuildContext context) => const ScanQrPage(),
        "/generate": (BuildContext context) => const GenerateQrPage(),
        "/settings": (BuildContext context) => const SettingsPage(),
        "/about": (BuildContext context) => const AboutPage(),
        "/scan_result": (BuildContext context) => const ScanResultPage(),
      },
    );
  }
}

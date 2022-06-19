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
        HomePage.routeName: (BuildContext context) => const HomePage(),
        ScanQrPage.routeName: (BuildContext context) => const ScanQrPage(),
        GenerateQrPage.routeName: (BuildContext context) => const GenerateQrPage(),
        SettingsPage.routeName: (BuildContext context) => const SettingsPage(),
        AboutPage.routeName: (BuildContext context) => const AboutPage(),
        ScanResultPage.routeName: (BuildContext context) => const ScanResultPage(),
      },
    );
  }
}

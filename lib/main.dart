import 'package:flutter/material.dart';
import 'package:qr_tools/pages/about.dart';
import 'package:qr_tools/pages/generate_qr.dart';
import 'package:qr_tools/pages/home.dart';
import 'package:qr_tools/pages/scan_qr.dart';
import 'package:qr_tools/pages/scan_result.dart';
import 'package:qr_tools/types/generate_qr_args.dart';
import 'package:quick_actions/quick_actions.dart';

void main() {
  runApp(const QrToolsApp());
}

class QrToolsApp extends StatefulWidget {
  const QrToolsApp({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrToolsApp();
}

class _QrToolsApp extends State<QrToolsApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final QuickActions quickActions = const QuickActions();

  @override
  void initState() {
    super.initState();
    _setupQuickActions();
    _handleQuickActions();
  }

  void _setupQuickActions() {
    quickActions.setShortcutItems(
      <ShortcutItem>[
        const ShortcutItem(
          type: 'action_scan',
          localizedTitle: 'Scan QR Code',
          icon: 'scan_qr',
        ),
        const ShortcutItem(
          type: 'action_generate',
          localizedTitle: 'Generate QR Code',
          icon: 'generate_qr',
        )
      ],
    );
  }

  void _handleQuickActions() {
    quickActions.initialize((shortcutType) {
      if (shortcutType == 'action_scan') {
        navigatorKey.currentState?.pushNamed(ScanQrPage.routeName);
      } else if (shortcutType == 'action_generate') {
        navigatorKey.currentState?.pushNamed(GenerateQrPage.routeName, arguments: GenerateQrArgs(const Color(0xFF84DCCF), false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Tools',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        HomePage.routeName: (BuildContext context) => const HomePage(),
        ScanQrPage.routeName: (BuildContext context) => const ScanQrPage(),
        GenerateQrPage.routeName: (BuildContext context) =>
            const GenerateQrPage(),
        AboutPage.routeName: (BuildContext context) => const AboutPage(),
        ScanResultPage.routeName: (BuildContext context) =>
            const ScanResultPage(),
      },
    );
  }
}

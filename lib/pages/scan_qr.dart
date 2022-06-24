import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_tools/pages/scan_result.dart';

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/scan';

  @override
  State<StatefulWidget> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  final MobileScannerController cameraController = MobileScannerController();
  bool isTorchEnabled = false;

  @override
  Widget build(BuildContext context) {
    _toggleTorchEnable() {
      setState(() {
        isTorchEnabled = !isTorchEnabled;
      });
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (barcode, args) {
              Navigator.pushNamed(
                context,
                ScanResultPage.routeName,
                arguments: barcode,
              );
            },
          ),
          Positioned(
            left: 0,
            top: MediaQuery.of(context).viewPadding.top +
                MediaQuery.of(context).size.height * 0.03,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: MediaQuery.of(context).size.height * 0.03,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: IconButton(
                onPressed: () {
                  _toggleTorchEnable();
                  cameraController.toggleTorch();
                },
                icon: Icon(
                  isTorchEnabled ? Icons.flashlight_on : Icons.flashlight_off,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.03,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.photo,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

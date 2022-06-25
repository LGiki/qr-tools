import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_tools/types/generate_qr_args.dart';
import 'package:qr_tools/widgets/qr_code_settings.dart';

class GenerateQrPage extends StatefulWidget {
  const GenerateQrPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/generate';

  @override
  State<StatefulWidget> createState() => _GenerateQrPageState();
}

class _GenerateQrPageState extends State<GenerateQrPage> {
  final TextEditingController _contentController = TextEditingController();

  String _content = "";
  int _errorCorrectionLevel = QrErrorCorrectLevel.L;
  Color _backgroundColor = Colors.white;
  Color _foregroundColor = Colors.black;
  QrEyeShape _qrEyeShape = QrEyeShape.square;
  QrDataModuleShape _qrDataModuleShape = QrDataModuleShape.square;

  void _setErrorCorrectionLevel(int? errorCorrectionLevel) {
    setState(() {
      _errorCorrectionLevel = errorCorrectionLevel ?? QrErrorCorrectLevel.L;
    });
  }

  void _setBackgroundColor(Color backgroundColor) {
    setState(() {
      _backgroundColor = backgroundColor;
    });
  }

  void _setForegroundColor(Color foregroundColor) {
    setState(() {
      _foregroundColor = foregroundColor;
    });
  }

  void _setContent(String content) {
    setState(() {
      _content = content;
    });
  }

  void _setQrEyeShape(QrEyeShape qrEyeShape) {
    setState(() {
      _qrEyeShape = qrEyeShape;
    });
  }

  void _setQrDataModuleShape(QrDataModuleShape qrDataModuleShape) {
    setState(() {
      _qrDataModuleShape = qrDataModuleShape;
    });
  }

  void _showLargeQrDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2))),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: QrImage(
              foregroundColor: _foregroundColor,
              backgroundColor: _backgroundColor,
              data: _content,
              version: QrVersions.auto,
              errorCorrectionLevel: _errorCorrectionLevel,
            ),
          ),
        );
      },
    );
  }

  void _pasteFromClipboard() {
    Clipboard.getData(Clipboard.kTextPlain).then((value) {
      final newText = value?.text ?? "";
      _contentController.value = _contentController.value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
      _setContent(newText);
    });
  }

  // GlobalKey globalKey = GlobalKey();

  // Future<void> _capturePng() async {
  //   RenderRepaintBoundary boundary =
  //       globalKey.currentContext.findRenderObject();
  //   ui.image = await boundary.toImage();
  //   ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   Uint8List pngBytes = byteData.buffer.asUint8List();
  //   print(pngBytes);
  // }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as GenerateQrArgs;

    if (args.pasteFromClipboard) {
      _pasteFromClipboard();
    }

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: args.backgroundColor,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: args.backgroundColor,
        foregroundColor: Colors.white,
        surfaceTintColor: args.backgroundColor,
        title: const Text('Generate QR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: _showLargeQrDialog,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    child: QrImage(
                      foregroundColor: _foregroundColor,
                      backgroundColor: _backgroundColor,
                      data: _content,
                      version: QrVersions.auto,
                      errorCorrectionLevel: _errorCorrectionLevel,
                      eyeStyle: QrEyeStyle(
                        eyeShape: _qrEyeShape,
                        color: Colors.black,
                      ),
                      dataModuleStyle: QrDataModuleStyle(
                        dataModuleShape: _qrDataModuleShape,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            TextButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              ),
              icon: const Icon(Icons.save),
              label: const Text('Save to photos'),
              onPressed: () => debugPrint('Save to photos'),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _contentController,
                  onChanged: _setContent,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Your content here...',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: _contentController.clear,
                    ),
                  ),
                  maxLines: 4,
                ),
              ),
            ),
            TextButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              ),
              icon: const Icon(Icons.paste),
              label: const Text('Paste from clipboard'),
              onPressed: _pasteFromClipboard,
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: QrCodeSettings(
                  errorCorrectionLevel: _errorCorrectionLevel,
                  backgroundColor: _backgroundColor,
                  foregroundColor: _foregroundColor,
                  onErrorCorrectionLevelChanged: _setErrorCorrectionLevel,
                  onBackgroundColorChanged: _setBackgroundColor,
                  onForegroundColorChanged: _setForegroundColor,
                  qrEyeShape: _qrEyeShape,
                  qrDataModuleShape: _qrDataModuleShape,
                  onQrEyeShapeChanged: _setQrEyeShape,
                  onQrDataModuleShapeChanged: _setQrDataModuleShape,
                ),
              ),
            ),
            TextButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Reset to default settings'),
              onPressed: () => debugPrint('Default'),
            ),
          ],
        ),
      ),
    );
  }
}

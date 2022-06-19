import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrPage extends StatelessWidget {
  const GenerateQrPage({Key? key}) : super(key: key);

  static const routeName = '/generate';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text('Generate QR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  child: QrImage(
                    data: "1234567890",
                    version: QrVersions.auto,
                    size: 200.0,
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
            const Divider(),
            const Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Your content here...',
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
              onPressed: () => debugPrint('Paste'),
            ),
            const Divider(),
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: const <Widget>[
                    SizedBox(
                      child: ListTile(
                        title: Text('Test'),
                        subtitle: Text('Test'),
                      ),
                    ),
                    SizedBox(
                      child: ListTile(
                        title: Text('Test'),
                        subtitle: Text('Test'),
                      ),
                    ),
                    SizedBox(
                      child: ListTile(
                        title: Text('Test'),
                        subtitle: Text('Test'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qr_tools/utils/url.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  static const routeName = '/about';

  _showLicensePage(BuildContext context, Color backgroundColor) async {
    final navigator = Navigator.of(context);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    navigator.push(
      MaterialPageRoute<void>(
        builder: (context) => Theme(
          data: ThemeData(
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: backgroundColor,
                  statusBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.dark),
              backgroundColor: backgroundColor,
              foregroundColor: Colors.white,
              elevation: 0,
            ),
          ),
          child: LicensePage(
            applicationVersion: "Version $version",
            applicationLegalese:
                'Made with 💙 by LGiki\nhttps://github.com/LGiki/qr-tools',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Color;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: args,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark),
        backgroundColor: args,
        foregroundColor: Colors.white,
        title: const Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Center(
                child: Text(
                  'QR Tools',
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Licenses'),
                    onTap: () {
                      _showLicensePage(context, args);
                    },
                  ),
                  ListTile(
                    title: const Text('Github'),
                    onTap: () {
                      Url.launchURL('https://github.com/LGiki/qr-tools');
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Center(
                child: Text(
                  'Made with 💙 by LGiki',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_tools/utils/custom_icons.dart';
import 'package:qr_tools/utils/util.dart';
import 'package:qr_tools/widgets/barcode_detail/isbn_detail.dart';
import 'package:qr_tools/widgets/barcode_detail/phone_number_detail.dart';
import 'package:qr_tools/widgets/barcode_detail/sms_detail.dart';
import 'package:qr_tools/widgets/barcode_detail/url_detail.dart';
import 'package:qr_tools/utils/url.dart';
import 'package:qr_tools/widgets/barcode_detail/wifi_detail.dart';
import 'package:share_plus/share_plus.dart';

class ScanResultPage extends StatelessWidget {
  const ScanResultPage({Key? key}) : super(key: key);

  static const routeName = '/scan_result';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Barcode;

    Widget parseResult() {
      return Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: () {
            switch (args.type) {
              case BarcodeType.url:
                return UrlDetail(url: args.rawValue!);
              case BarcodeType.isbn:
                return IsbnDetail(isbn: args.rawValue!);
              case BarcodeType.phone:
                return PhoneNumberDetail(phoneNumberUrl: args.rawValue!);
              case BarcodeType.sms:
                return SmsDetail(smsUrl: args.rawValue!);
              case BarcodeType.wifi:
                return WifiDetail(wifiUrl: args.rawValue!);
              default:
                return Container();
            }
          }(),
        ),
      );
    }

    _showSearchDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Search in ...'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  onTap: () {
                    Url.launchURL(
                        'https://www.google.com/search?q=${args.rawValue!}');
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(CustomIcons.google),
                    ],
                  ),
                  title: const Text('Google'),
                ),
                ListTile(
                  onTap: () {
                    Url.launchURL(
                        'https://bing.com/search?q=${args.rawValue!}');
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(CustomIcons.bing),
                    ],
                  ),
                  title: const Text('Bing'),
                ),
                ListTile(
                  onTap: () {
                    Url.launchURL(
                        'https://duckduckgo.com/?q=${args.rawValue!}');
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(CustomIcons.duckduckgo),
                    ],
                  ),
                  title: const Text('DuckDuckGo'),
                ),
                ListTile(
                  onTap: () {
                    Url.launchURL(
                        'https://yandex.com/search/?text=${args.rawValue!}');
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(CustomIcons.yandex),
                    ],
                  ),
                  title: const Text('Yandex'),
                ),
                ListTile(
                  onTap: () {
                    Url.launchURL(
                        'https://zh.wikipedia.org/w/index.php?search=${args.rawValue!}');
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(CustomIcons.wikipedia),
                    ],
                  ),
                  title: const Text('Wikipedia'),
                ),
                ListTile(
                  onTap: () {
                    Url.launchURL(
                        'https://www.baidu.com/s?wd=${args.rawValue!}');
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(CustomIcons.baidu),
                    ],
                  ),
                  title: const Text('Baidu'),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text('Scan Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () => debugPrint('asd'),
                  title: Text(args.rawValue!),
                ),
              ),
            ),
            Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        Util.copyToClipboard(args.rawValue!);
                      },
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.copy),
                        ],
                      ),
                      title: const Text('Copy'),
                    ),
                    ListTile(
                      onTap: () {
                        Share.share(args.rawValue!);
                      },
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.share),
                        ],
                      ),
                      title: const Text('Share'),
                    ),
                    ListTile(
                      onTap: _showSearchDialog,
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.search),
                        ],
                      ),
                      title: const Text('Search'),
                    ),
                  ],
                ),
              ),
            ),
            if (args.type == BarcodeType.url ||
                args.type == BarcodeType.isbn ||
                args.type == BarcodeType.phone ||
                args.type == BarcodeType.sms ||
                args.type == BarcodeType.wifi)
              parseResult(),
          ],
        ),
      ),
    );
  }
}

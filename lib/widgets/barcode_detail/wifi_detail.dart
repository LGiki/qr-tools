import 'package:flutter/material.dart';
import 'package:qr_tools/types/wifi.dart';
import 'package:qr_tools/utils/util.dart';

class WifiDetail extends StatelessWidget {
  const WifiDetail({Key? key, required this.wifiUrl}) : super(key: key);

  final String wifiUrl;

  Wifi parseWifiUrl(String wifiUrl) {
    var wifi = Wifi.empty();
    wifiUrl = wifiUrl.replaceFirst('WIFI:', '');
    var wifiUrlSegments = wifiUrl.split(';');
    for (var segment in wifiUrlSegments) {
      if (segment.isNotEmpty && segment.contains(':')) {
        var segmentSplit = segment.split(':');
        var key = segmentSplit[0];
        var value = segmentSplit[1];
        switch (key) {
          case 'T':
            wifi.authenticationType = value;
            break;
          case 'S':
            wifi.ssid = value;
            break;
          case 'P':
            wifi.password = value;
            break;
          case 'H':
            if (value == 'true') {
              wifi.isHidden = true;
            } else {
              wifi.isHidden = false;
            }
        }
      }
    }
    return wifi;
  }

  @override
  Widget build(BuildContext context) {
    final wifi = parseWifiUrl(wifiUrl);
    return Column(
      children: <Widget>[
        if (wifi.authenticationType != null)
          ListTile(
            onTap: () {
              Util.copyToClipboard(wifi.authenticationType!);
            },
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.lock),
              ],
            ),
            title: const Text('Authentication type'),
            subtitle: Text(wifi.authenticationType!),
          ),
        if (wifi.ssid != null)
          ListTile(
            onTap: () {
              Util.copyToClipboard(wifi.ssid!);
            },
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.title),
              ],
            ),
            title: const Text('SSID'),
            subtitle: Text(wifi.ssid!),
          ),
        if (wifi.password != null)
          ListTile(
            onTap: () {
              Util.copyToClipboard(wifi.password!);
            },
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.password),
              ],
            ),
            title: const Text('Password'),
            subtitle: Text(wifi.password!),
          ),
        if (wifi.isHidden != null)
          ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.hide_source),
              ],
            ),
            title: const Text('Hidden'),
            subtitle: Text(wifi.isHidden! ? 'True' : 'False'),
          ),
      ],
    );
  }
}

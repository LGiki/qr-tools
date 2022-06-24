import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_tools/utils/url.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PhoneNumberDetail extends StatelessWidget {
  const PhoneNumberDetail({Key? key, required this.phoneNumberUrl}) : super(key: key);

  final String phoneNumberUrl;

  @override
  Widget build(BuildContext context) {
    String phoneNumber = phoneNumberUrl.replaceAll(RegExp('tel:[//]*'), "");

    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            Url.launchURL('tel:$phoneNumber');
          },
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.call),
            ],
          ),
          title: Text('Call $phoneNumber'),
        ),
        ListTile(
          onTap: () {
            Url.launchURL('sms:$phoneNumber');
          },
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.sms),
            ],
          ),
          title: Text('Send SMS to $phoneNumber'),
        ),
        ListTile(
          onTap: () {
            Clipboard.setData(ClipboardData(text: phoneNumber)).then((value) => Fluttertoast.showToast(msg: 'Copied to clipboard'));
          },
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.copy),
            ],
          ),
          title: Text('Copy $phoneNumber'),
        ),
      ],
    );
  }
}
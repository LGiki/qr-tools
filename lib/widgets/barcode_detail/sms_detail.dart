import 'package:flutter/material.dart';
import 'package:qr_tools/types/smsto.dart';
import 'package:qr_tools/utils/url.dart';
import 'package:qr_tools/utils/util.dart';

class SmsDetail extends StatelessWidget {
  const SmsDetail({Key? key, required this.smsUrl}) : super(key: key);

  final String smsUrl;

  SmsTo parseSmsUrl(String smsUrl) {
    var smsTo = SmsTo.empty();
    smsUrl = smsUrl.replaceFirst('SMSTO:', '');
    var smsUrlSegments = smsUrl.split(':');
    if (smsUrlSegments.length == 2) {
      smsTo.phoneNumber = smsUrlSegments[0];
      smsTo.message = smsUrlSegments[1];
    }
    return smsTo;
  }

  @override
  Widget build(BuildContext context) {
    final sms = parseSmsUrl(smsUrl);
    return Column(
      children: <Widget>[
        if (sms.phoneNumber != null)
          ListTile(
            onTap: () {
              Util.copyToClipboard(sms.phoneNumber!);
            },
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.person),
              ],
            ),
            title: const Text('To'),
            subtitle: Text(sms.phoneNumber!),
          ),
        if (sms.message != null)
          ListTile(
            onTap: () {
              Util.copyToClipboard(sms.message!);
            },
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.message),
              ],
            ),
            title: const Text('Message'),
            subtitle: Text(sms.message!),
          ),
        ListTile(
          onTap: () {
            Url.launchURL(smsUrl);
          },
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.send),
            ],
          ),
          title: const Text('Send SMS'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qr_tools/utils/url.dart';

class UrlDetail extends StatelessWidget {
  const UrlDetail({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            Url.launchURL(url);
          },
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.language),
            ],
          ),
          title: const Text('Open in browser'),
        ),
      ],
    );
  }
}
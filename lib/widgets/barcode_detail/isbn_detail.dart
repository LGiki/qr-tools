import 'package:flutter/material.dart';
import 'package:qr_tools/utils/custom_icons.dart';
import 'package:qr_tools/utils/url.dart';

class IsbnDetail extends StatelessWidget {
  const IsbnDetail({Key? key, required this.isbn}) : super(key: key);

  final String isbn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            Url.launchURL(
                'https://www.amazon.com/s?i=stripbooks&rh=p_66%3A$isbn');
          },
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(CustomIcons.amazon),
            ],
          ),
          title: const Text('Search in Amazon'),
        ),
        ListTile(
          onTap: () {
            Url.launchURL('http://douban.com/isbn/$isbn/');
          },
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(CustomIcons.douban),
            ],
          ),
          title: const Text('Search in Douban'),
        ),
        ListTile(
          onTap: () {
            Url.launchURL('https://www.duozhuayu.com/search/book/$isbn');
          },
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.language),
            ],
          ),
          title: const Text('Search in Duozhuayu'),
        ),
      ],
    );
  }
}

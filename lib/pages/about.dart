import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.teal[400],
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark
        ),
        backgroundColor: Colors.teal[400],
        foregroundColor: Colors.white,
        title: const Text('About'),
      ),
      body: ListView(

      ),
    );
  }
}
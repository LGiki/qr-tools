import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class Util {
  static void copyToClipboard(String content) {
    Clipboard.setData(ClipboardData(text: content))
        .then((value) => Fluttertoast.showToast(msg: 'Copied to clipboard'));
  }
}

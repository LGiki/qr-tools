import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:image_picker/image_picker.dart';

class QrCodeSettings extends StatelessWidget {
  const QrCodeSettings({
    Key? key,
    required this.errorCorrectionLevel,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onBackgroundColorChanged,
    required this.onForegroundColorChanged,
    required this.onErrorCorrectionLevelChanged,
    required this.qrEyeShape,
    required this.qrDataModuleShape,
    required this.onQrEyeShapeChanged,
    required this.onQrDataModuleShapeChanged,
    required this.qrEmbedImage,
    required this.onQrEmbedImageChanged,
  }) : super(key: key);

  final int errorCorrectionLevel;
  final ValueChanged<int?> onErrorCorrectionLevelChanged;
  final Color backgroundColor;
  final ValueChanged<Color> onBackgroundColorChanged;
  final Color foregroundColor;
  final ValueChanged<Color> onForegroundColorChanged;
  final QrEyeShape qrEyeShape;
  final ValueChanged<QrEyeShape> onQrEyeShapeChanged;
  final QrDataModuleShape qrDataModuleShape;
  final ValueChanged<QrDataModuleShape> onQrDataModuleShapeChanged;
  final Image? qrEmbedImage;
  final ValueChanged<Image?> onQrEmbedImageChanged;

  _showBottomPicker(BuildContext context, Widget title, List<Widget> items,
      int initialItemIndex, ValueChanged<int> onSelectedItemChanged) {
    FocusScope.of(context).unfocus();
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.antiAlias,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: title,
              ),
              Flexible(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                      initialItem: initialItemIndex),
                  itemExtent: 35,
                  onSelectedItemChanged: onSelectedItemChanged,
                  children: items,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _showErrorCorrectionLevelDialog(BuildContext context) {
    FocusScope.of(context).unfocus();
    var initialItemIndex = 0;
    switch (errorCorrectionLevel) {
      case QrErrorCorrectLevel.L:
        initialItemIndex = 0;
        break;
      case QrErrorCorrectLevel.M:
        initialItemIndex = 1;
        break;
      case QrErrorCorrectLevel.Q:
        initialItemIndex = 2;
        break;
      case QrErrorCorrectLevel.H:
        initialItemIndex = 3;
        break;
    }
    _showBottomPicker(
      context,
      const Text(
        'Error correction level',
        style: TextStyle(fontSize: 18),
      ),
      const <Widget>[
        Center(
          child: Text('Level L – up to 7% damage'),
        ),
        Center(
          child: Text('Level M – up to 15% damage'),
        ),
        Center(
          child: Text('Level Q – up to 25% damage'),
        ),
        Center(
          child: Text('Level H – up to 30% damage'),
        ),
      ],
      initialItemIndex,
      (val) {
        switch (val) {
          case 0:
            onErrorCorrectionLevelChanged(QrErrorCorrectLevel.L);
            break;
          case 1:
            onErrorCorrectionLevelChanged(QrErrorCorrectLevel.M);
            break;
          case 2:
            onErrorCorrectionLevelChanged(QrErrorCorrectLevel.Q);
            break;
          case 3:
            onErrorCorrectionLevelChanged(QrErrorCorrectLevel.H);
            break;
        }
      },
    );
  }

  _showQrEyeShapeDialog(BuildContext context) {
    FocusScope.of(context).unfocus();
    var initialItemIndex = 0;
    switch (qrEyeShape) {
      case QrEyeShape.square:
        initialItemIndex = 0;
        break;
      case QrEyeShape.circle:
        initialItemIndex = 1;
        break;
    }
    _showBottomPicker(
      context,
      const Text(
          'QR eye shape',
          style: TextStyle(fontSize: 18),
      ),
      const <Widget>[
        Center(
          child: Text('Square'),
        ),
        Center(
          child: Text('Circle'),
        ),
      ],
      initialItemIndex,
      (value) {
        switch (value) {
          case 0:
            onQrEyeShapeChanged(QrEyeShape.square);
            break;
          case 1:
            onQrEyeShapeChanged(QrEyeShape.circle);
            break;
        }
      },
    );
  }

  _showQrDataModuleShapeDialog(BuildContext context) {
    FocusScope.of(context).unfocus();
    var initialItemIndex = 0;
    switch (qrDataModuleShape) {
      case QrDataModuleShape.square:
        initialItemIndex = 0;
        break;
      case QrDataModuleShape.circle:
        initialItemIndex = 1;
        break;
    }
    _showBottomPicker(
      context,
      const Text(
          'QR data module shape',
          style: TextStyle(fontSize: 18),
      ),
      const <Widget>[
        Center(
          child: Text('Square'),
        ),
        Center(
          child: Text('Circle'),
        ),
      ],
      initialItemIndex,
      (value) {
        switch (value) {
          case 0:
            onQrDataModuleShapeChanged(QrDataModuleShape.square);
            break;
          case 1:
            onQrDataModuleShapeChanged(QrDataModuleShape.circle);
            break;
        }
      },
    );
  }

  _showColorPickerDialog(
      BuildContext context, Color color, ValueChanged<Color> onColorChanged) {
    FocusScope.of(context).unfocus();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2))),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: color,
              onColorChanged: onColorChanged,
              colorPickerWidth: 300,
              pickerAreaHeightPercent: 0.7,
              enableAlpha: true,
              pickerAreaBorderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(2),
              ),
              hexInputBar: true,
            ),
          ),
        );
      },
    );
  }

  String getQrErrorCorrectionLevelString(int qrErrorCorrectionLevel) {
    switch (qrErrorCorrectionLevel) {
      case QrErrorCorrectLevel.L:
        return 'Level L';
      case QrErrorCorrectLevel.M:
        return 'Level M';
      case QrErrorCorrectLevel.H:
        return 'Level H';
      case QrErrorCorrectLevel.Q:
        return 'Level Q';
    }
    return 'Unknown';
  }

  String getQrEyeShapeString(QrEyeShape qrEyeShape) {
    switch (qrEyeShape) {
      case QrEyeShape.square:
        return 'Square';
      case QrEyeShape.circle:
        return 'Circle';
    }
  }

  String getQrDataModuleShapeString(QrDataModuleShape qrDataModuleShape) {
    switch (qrDataModuleShape) {
      case QrDataModuleShape.square:
        return 'Square';
      case QrDataModuleShape.circle:
        return 'Circle';
    }
  }

  Widget listTileColorPicker(BuildContext context, Widget title, Color color,
      ValueChanged<Color> onColorChanged) {
    return ListTile(
      onTap: () => _showColorPickerDialog(context, color, onColorChanged),
      title: title,
      subtitle: Text('#${color.value.toRadixString(16)}'),
      trailing: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          child: listTileColorPicker(context, const Text('Foreground color'),
              foregroundColor, onForegroundColorChanged),
        ),
        SizedBox(
          child: listTileColorPicker(context, const Text('Background color'),
              backgroundColor, onBackgroundColorChanged),
        ),
        SizedBox(
          child: ListTile(
            onTap: () => _showErrorCorrectionLevelDialog(context),
            title: const Text('Error correction level'),
            subtitle:
                Text(getQrErrorCorrectionLevelString(errorCorrectionLevel)),
          ),
        ),
        SizedBox(
          child: ListTile(
            onTap: () => _showQrEyeShapeDialog(context),
            title: const Text('QR eye shape'),
            subtitle: Text(getQrEyeShapeString(qrEyeShape)),
          ),
        ),
        SizedBox(
          child: ListTile(
            onTap: () => _showQrDataModuleShapeDialog(context),
            title: const Text('QR data module shape'),
            subtitle: Text(getQrDataModuleShapeString(qrDataModuleShape)),
          ),
        ),
        SizedBox(
          child: ListTile(
            onTap: () async {
              FocusScope.of(context).unfocus();
              final ImagePicker imagePicker = ImagePicker();
              final XFile? imageFile =
                  await imagePicker.pickImage(source: ImageSource.gallery);
              if (imageFile != null) {
                onQrEmbedImageChanged(Image.file(File(imageFile.path)));
              } else {
                Fluttertoast.showToast(msg: 'No select any files');
              }
            },
            onLongPress: () {
              onQrEmbedImageChanged(null);
              Fluttertoast.showToast(msg: 'Clear selected image');
            },
            trailing: qrEmbedImage,
            title: const Text('Embed image'),
            subtitle: const Text(
                'Select an image to be overlaid in the center of the QR code'),
          ),
        ),
      ],
    );
  }
}

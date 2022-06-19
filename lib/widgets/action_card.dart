import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  const ActionCard({
    Key? key,
    this.cardColor,
    this.textStyle,
    required this.title,
    this.onTap,
    this.padding,
    this.borderRadius,
    required this.backgroundImage,
  }) : super(key: key);

  final Color? cardColor;

  final TextStyle? textStyle;

  final String title;

  final GestureTapCallback? onTap;

  final EdgeInsetsGeometry? padding;

  final BorderRadiusGeometry? borderRadius;

  final Image backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius:
          borderRadius ?? const BorderRadius.all(Radius.circular(20.0))),
      color: cardColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(14.0),
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            fit: StackFit.expand,
            children: <Widget>[backgroundImage, Text(title, style: textStyle ?? const TextStyle(fontSize: 20, color: Colors.white))],
          ),
        ),
      ),
    );
  }
}
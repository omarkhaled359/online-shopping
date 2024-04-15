import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';

class WebMobileSize extends StatelessWidget{
  const WebMobileSize({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double padding = 0.0;
    if (width > height) padding = width / 2 - height / 4;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: child,
    );
  }
}
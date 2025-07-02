import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader extends StatelessWidget {
  final int size;
  Color? color;
  CustomLoader({this.size = 40, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    color ??= Theme.of(context).primaryColor;
    return SpinKitFadingCircle(
      color: color,
      size: size.toDouble(),
    );
  }
}

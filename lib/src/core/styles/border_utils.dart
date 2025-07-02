import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderUtils {
  static BorderRadiusGeometry getBorder(
          {int topLeft = 0,
          int topRight = 0,
          int bottomLeft = 0,
          int bottomRight = 0}) =>
      BorderRadius.only(
          topLeft: getRadius(topLeft.h),
          topRight: getRadius(topRight.h),
          bottomLeft: getRadius(bottomLeft.h),
          bottomRight: getRadius(bottomRight.h));

  static BorderRadiusGeometry getBorderItem({required double borderRadius}) =>
      BorderRadius.circular(borderRadius);

  static getDecorationShape(
          {double radius = 0.0, Color borderColor = Colors.transparent}) =>
      RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: getBorderItem(borderRadius: radius));

  static Radius getRadius(double radius) => Radius.circular(radius);

  static getDefaultInputBoder(BuildContext context) => UnderlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).primaryColor));

  static getRoundedInputBorder({radius = 8, color = Colors.grey}) =>
      OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color));
}

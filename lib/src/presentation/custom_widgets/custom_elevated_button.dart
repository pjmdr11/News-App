import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kliq_technical_test/src/core/styles/styles.dart';
import 'package:kliq_technical_test/src/presentation/custom_widgets/custom_widgets.dart';

class CustomElevatedButton extends StatelessWidget {
  Color? bgColor;
  String? title;
  Function()? onPressed;
  late double border;
  TextStyle? textStyle;
  late Color titleColor;
  late int horizontalPadding;
  late int verticalPadding;
  late bool loading;
  bool enabled = true;
  bool primary;

  CustomElevatedButton({
    Key? key,
    @required this.title,
    @required this.onPressed,
    this.bgColor,
    this.titleColor = Colors.white,
    this.horizontalPadding = 0,
    this.verticalPadding = 14,
    this.loading = false,
    this.primary = true,
    this.enabled = true,
    this.border = 8.0,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bgColor ??= Theme.of(context).primaryColor;
    textStyle ??=
        Theme.of(context).textTheme.bodyMedium!.copyWith(color: titleColor);
    if (loading) {
      verticalPadding = 2;
    }
    var style = ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(
            horizontal: horizontalPadding.h, vertical: verticalPadding.h)),
        backgroundColor: WidgetStateProperty.all(bgColor),
        shape: WidgetStateProperty.all(
            BorderUtils.getDecorationShape(radius: border)));
    if (!primary) {
      textStyle = Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: Theme.of(context).primaryColor);
      style = ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.symmetric(
              horizontal: horizontalPadding.h, vertical: verticalPadding.h)),
          backgroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(BorderUtils.getDecorationShape(
              radius: border, borderColor: Theme.of(context).primaryColor)));
    }
    return ElevatedButton(
      onPressed: () {
        if (loading) return;
        if (!enabled) return;
        onPressed!();
      },
      style: style,
      child: (loading)
          ? CustomLoader(
              color: titleColor,
              size: 20,
            )
          : Text(title ?? "", style: textStyle),
    );
  }
}

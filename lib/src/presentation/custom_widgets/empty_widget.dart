import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kliq_technical_test/src/core/constants/constants.dart';

class EmptyWidget extends StatelessWidget {
  final IconData? icon;
  final String? title;
  const EmptyWidget({this.title, this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon ?? Icons.list,
            size: 120.w,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            title ?? errEmptyData,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({
    Key? key,
    required this.title,
    required this.color,
    required this.padding,
  }) : super(key: key);
  final String title;
  final double padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.size.width,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Text(
            title,
            style: TextStyle(color: color),
          ),
        ),
      ),
    );
  }
}

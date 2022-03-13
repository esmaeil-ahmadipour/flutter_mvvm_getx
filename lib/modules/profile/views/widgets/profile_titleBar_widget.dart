import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTitleBarWidget extends StatelessWidget {
  const ProfileTitleBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(title,style:TextStyle(fontSize: Theme.of(context).primaryTextTheme.headline6!.fontSize),).paddingOnly(bottom: 8.0, top: 16.0),
    );
  }
}
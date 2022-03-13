import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/core/models/user.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    Key? key,
    required this.user,
    this.nameStatic,
  }) : super(key: key);
  final User user;

  final String? nameStatic;

  @override
  Widget build(BuildContext context) {
    return Text(
      nameStatic ?? user.name!,
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

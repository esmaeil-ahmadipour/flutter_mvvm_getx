import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.height = kToolbarHeight,
    required this.onTap,
    required this.title,
  });

  final double height;
  final String title;
  final Function() onTap;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Theme.of(context).colorScheme.primary,
      child: Row(children: [
        GestureDetector(
          onTap: () => onTap(),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 16.0, end: 8.0),
            child: SizedBox(
              width: 48,
              child: CircleAvatar(
                  child: Icon(Icons.supervised_user_circle,
                      color: Theme.of(context).primaryColor, size: 40),
                  backgroundColor: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
        SizedBox(
            child: Text(
              title,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            width: Get.size.width - 72),
      ]),
    );
  }
}

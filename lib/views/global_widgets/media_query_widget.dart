import 'package:flutter/material.dart';

class MediaQueryWidget extends StatelessWidget {
  final Widget? child;

  const MediaQueryWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      //Setting font does not change with system font size
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Container(
        child: SafeArea(child: child!),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class WidgetError extends StatelessWidget {
  const WidgetError({
    Key? key,
    required this.error,
  }) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error));
  }
}

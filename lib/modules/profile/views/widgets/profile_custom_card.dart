import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/modules/profile/view_models/profile_viewModel.dart';
import 'package:get/get.dart';

class ProfileCustomCard extends GetView<ProfileViewModel> {
  const ProfileCustomCard({
    Key? key,
    required this.child, this.height=200, required this.color,
  }) : super(key: key);
  final Widget child;
  final double? height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (ProfileViewModel controller) =>Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.all( 16.0),
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color.withOpacity(1.0), width: 1.2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child:  ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: child,
      ),
    ));
  }
}

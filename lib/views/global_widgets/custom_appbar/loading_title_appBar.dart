import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/views/global_widgets/widgets/shimmer_list_tile.dart';
import 'package:get/get.dart';

class LoadingTitleAppBar extends StatelessWidget {
  const LoadingTitleAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      padding:  EdgeInsetsDirectional.only(end: Get.width/2),
      height: 24,
      width: 24,
      child: const ShimmerListTile(),
    );
  }
}

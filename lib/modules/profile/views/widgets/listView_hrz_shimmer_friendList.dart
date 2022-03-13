import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/views/global_widgets/widgets/shimmer_list_tile.dart';
import 'package:flutter_mvvm_getx/modules/profile/view_models/profile_viewModel.dart';
import 'package:get/get.dart';

class FriendsListViewHorizontalShimmer extends GetView<ProfileViewModel> {
  const FriendsListViewHorizontalShimmer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        builder: (ProfileViewModel controller) => SizedBox(
          height: 24,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemExtent: 80,
              itemBuilder: (context, index) {
                return  const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: ShimmerListTile(
                  ),
                );
              }),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/modules/profile/view_models/profile_viewModel.dart';
import 'package:flutter_mvvm_getx/modules/profile/views/widgets/listView_hrz_friendList.dart';
import 'package:flutter_mvvm_getx/modules/profile/views/widgets/listView_hrz_shimmer_friendList.dart';
import 'package:get/get.dart';

class ProfileFriendsWidget extends GetView<ProfileViewModel> {
  const ProfileFriendsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (ProfileViewModel controller) => SizedBox(
        height: 60,
        child: controller.uiState.value.when(
          init: () => const Center(
              child: CircularProgressIndicator(
            color: Colors.red,
          )),
          loading: () =>
              const Center(child: FriendsListViewHorizontalShimmer()),
          success: (data) => FriendsListViewHorizontal(user: data[0]),
          error: (error) => Center(
            child: Text("error:$error"),
          ),
        ),
      ),
    );
  }
}

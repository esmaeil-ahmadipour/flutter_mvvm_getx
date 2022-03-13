import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/core/models/user.dart';
import 'package:flutter_mvvm_getx/views/global_widgets/widgets/shimmer_list_tile.dart';
import 'package:flutter_mvvm_getx/modules/profile/view_models/profile_viewModel.dart';
import 'package:flutter_mvvm_getx/modules/profile/views/widgets/listView_hrz_shimmer_friendList.dart';
import 'package:flutter_mvvm_getx/utils/constants/main_theme.dart';
import 'package:get/get.dart';

class ProfileTopWidget extends GetView<ProfileViewModel> {
  const ProfileTopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (ProfileViewModel controller) => SizedBox(
          height: 200,
          child: controller.uiState.value.when(
            init: () => const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            )),
            loading: () =>
                const Center(child: ShimmerListTile()),
            success: (data) => ProfileInfoCard(user: data[0]),
            error: (error) => const SizedBox.shrink(),
          )),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Text(
            "balance".tr,
            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
          ),
          Text(" ${user.balance!}" ,style: const TextStyle(fontSize: 16))
        ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "age".tr,
                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
              ),
              Text(" ${user.age}",style: const TextStyle(fontSize: 16)),
              const Spacer(),
              Text(
                "registered".tr,
                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
              ),
              Text(" ${user.registered}",style: const TextStyle(fontSize: 16)),
            ]),
        Row(children: [
          SizedBox(
            width: (user.isOwner ?? false) ? Get.width - 142.0 : Get.width - 67,
            child: RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              softWrap: true,
              text: TextSpan(children: [
                TextSpan(
                  text: "about".tr,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,fontSize: 16
                  ),
                ),
                TextSpan(
                  text: ' ${user.about}',
                  style:
                      const TextStyle(color: Colors.black,fontSize: 16),
                ),
              ]),
            ),
          ),
          if (user.isOwner ?? false)
            MaterialButton(
              onPressed: () {},
              minWidth: 75,
              color: MainThemes.colorConfirm,
              shape: const StadiumBorder(),
              child: Text(
                "edit".tr,
                style: TextStyle(color: MainThemes.lightColorText),
              ),
            )
        ]),
      ],
    ).paddingAll(16.0);
  }
}

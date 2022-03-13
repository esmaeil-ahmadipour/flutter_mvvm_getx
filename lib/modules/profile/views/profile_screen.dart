import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/modules/profile/view_models/profile_viewModel.dart';
import 'package:flutter_mvvm_getx/modules/profile/views/widgets/greeting_widget.dart';
import 'package:flutter_mvvm_getx/modules/profile/views/widgets/profile_custom_card.dart';
import 'package:flutter_mvvm_getx/modules/profile/views/widgets/profile_friends_widget.dart';
import 'package:flutter_mvvm_getx/modules/profile/views/widgets/profile_titleBar_widget.dart';
import 'package:flutter_mvvm_getx/modules/profile/views/widgets/profile_top_widget.dart';
import 'package:flutter_mvvm_getx/modules/profile/views/widgets/widge_terror.dart';
import 'package:flutter_mvvm_getx/views/global_widgets/custom_appbar/customized_appbar.dart';
import 'package:get/get.dart';


class ProfileScreen extends GetView<ProfileViewModel> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        builder: (ProfileViewModel controller) => Scaffold(
            appBar: CustomAppBar(
              onTap: () {
                Get.back();
              },
              title: controller.uiState,
            ),
            body: WidgetError(
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  ProfileCustomCard(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    height: 200, child: const ProfileTopWidget(),),

                  ProfileTitleBarWidget(title: 'friends'.tr),
                  ProfileCustomCard(
                      color: Theme.of(context).cardColor,
                      height: 80,
                      child: const ProfileFriendsWidget()),

                  ProfileTitleBarWidget(title: 'greeting'.tr),
                  const GreetingWidget(),

                ],
              )),
            )));
  }
}


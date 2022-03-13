import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/core/models/user.dart';
import 'package:flutter_mvvm_getx/modules/profile/view_models/profile_viewModel.dart';
import 'package:get/get.dart';

class FriendsListViewHorizontal extends GetView<ProfileViewModel> {
  const FriendsListViewHorizontal({required this.user, Key? key})
      : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        builder: (ProfileViewModel controller) => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: user.friends!.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: GestureDetector(
                    onTap: () {
                      controller.navigateToProfilePage(
                          guid: user.friends![index].guid);
                      log("NAME>>>>>${user.friends![index].name}");
                    },
                    child: Chip(
                        label: Text("${user.friends![index].name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                                color:
                                    Theme.of(context).colorScheme.onPrimary)),
                        backgroundColor: Theme.of(context).colorScheme.primary),
                  ),
                ),
              );
            }));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/core/models/ui_state.dart';
import 'package:flutter_mvvm_getx/views/global_widgets/custom_appbar/loading_title_appBar.dart';
import 'package:flutter_mvvm_getx/views/global_widgets/custom_appbar/title_appBar.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.height = kToolbarHeight,
    required this.onTap,
    required this.title,
     this.titleStatic,
  });

  final double height;
  final String? titleStatic;
  final Rx<UiState> title;
  final Function() onTap;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Theme.of(context).colorScheme.primary,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => onTap(),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.only(start: 16.0, end: 8.0),
                child: SizedBox(
                  width: 48,
                  child: CircleAvatar(
                      child: Icon(Icons.supervised_user_circle,
                          color: Theme.of(context).primaryColor, size: 40),
                      backgroundColor: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
            Obx(() {
              return SizedBox(
                  child: title.value.when(
                      init: () => const LoadingTitleAppBar(),
                      loading: () => const LoadingTitleAppBar(),
                      success: (data) => TitleAppBar(user: data[0],nameStatic: titleStatic,),
                      error: (error) => const Text("")),
                  width: Get.size.width - 72);
            }),
          ]),
    );
  }
}

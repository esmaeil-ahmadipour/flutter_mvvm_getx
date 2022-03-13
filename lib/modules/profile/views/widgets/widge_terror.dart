import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/modules/profile/view_models/profile_viewModel.dart';
import 'package:get/get.dart';

class WidgetError extends GetView<ProfileViewModel> {
  const WidgetError({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        builder: (ProfileViewModel controller) =>
            controller.uiState.value.isError
                ? Container(
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2.0),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    height: Get.size.height - (56 - 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Error at profile page !",
                          style: TextStyle(fontSize: 16),
                        ).paddingAll(4.0),
                        const Text("Press back to continue.",
                                style: TextStyle(fontSize: 16))
                            .paddingAll(4.0),
                        Center(
                          child: MaterialButton(
                              shape: const StadiumBorder(),
                              color: Theme.of(context).colorScheme.primary,
                              onPressed: () {
                                Get.back();
                              },
                              child: Text("Back",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary))),
                        )
                      ],
                    ),
                  )
                : child);
  }
}

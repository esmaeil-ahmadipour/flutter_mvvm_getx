import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/modules/main/views/widgets/shimmer_list_view.dart';
import 'package:flutter_mvvm_getx/modules/main/views/widgets/user_list_tile.dart';
import 'package:flutter_mvvm_getx/modules/main/views/widgets/widget_error.dart';
import 'package:flutter_mvvm_getx/modules/main/view_models/main_viewModel.dart';
import 'package:flutter_mvvm_getx/views/global_widgets/custom_appbar/customized_appbar.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainViewModel> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        builder: (MainViewModel controller) => Scaffold(
            appBar: CustomAppBar(
              titleStatic: controller.argument!.name,
              onTap: (){
                controller.navigateToProfilePage();
              },
              title:controller.uiState ,
                ),
            body: controller.uiState.value.when(
                init: () => const ShimmerListView(),
                loading: () => const ShimmerListView(),
                success: (data) => UserListView(data: data),
                error: (err) => WidgetError(error: err))));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/modules/main/views/widgets/shimmer_list_view.dart';
import 'package:flutter_mvvm_getx/modules/main/views/widgets/user_list_tile.dart';
import 'package:flutter_mvvm_getx/modules/main/views/widgets/widget_error.dart';
import 'package:flutter_mvvm_getx/modules/main/view_models/main_viewModel.dart';
import 'package:flutter_mvvm_getx/views/global_widgets/customized_appbar.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainViewModel> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        builder: (MainViewModel controller) => const Scaffold(
     ));
  }
}

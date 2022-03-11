import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/modules/splash/views/widgets/splash_title.dart';
import 'package:flutter_mvvm_getx/modules/splash/view_models/splash_viewModel.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashViewModel> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        builder: (SplashViewModel controller) => Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SplashTitle(title: 'app_name'.tr, padding: 16),
                  SplashTitle(title: 'app_description'.tr, padding: 32)
                ])));
  }
}

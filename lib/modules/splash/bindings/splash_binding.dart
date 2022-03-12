import 'package:flutter_mvvm_getx/modules/splash/view_models/splash_viewModel.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashViewModel(),fenix: true,
    );
  }
}

import 'package:flutter_mvvm_getx/data/repositories/json_repository.dart';
import 'package:flutter_mvvm_getx/data/repositories/json_repository_imp.dart';
import 'package:flutter_mvvm_getx/modules/splash/view_models/splash_viewModel.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashViewModel(),fenix: true,
    );
    Get.lazyPut<JsonRepository>(
          () => JsonRepositoryImpl(),
      tag: (JsonRepository).toString(),
    );
  }
}

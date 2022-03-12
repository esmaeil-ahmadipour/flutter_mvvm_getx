import 'package:flutter_mvvm_getx/data/repositories/json_repository.dart';
import 'package:flutter_mvvm_getx/data/repositories/json_repository_imp.dart';
import 'package:flutter_mvvm_getx/modules/login/view_models/login_viewModel.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginViewModel(),fenix: true,
    );
    Get.lazyPut<JsonRepository>(
          () => JsonRepositoryImpl(),
      tag: (JsonRepository).toString(),
    );
  }
}

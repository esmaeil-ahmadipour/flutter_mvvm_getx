import 'package:flutter_mvvm_getx/data/repositories/json_repository.dart';
import 'package:flutter_mvvm_getx/data/repositories/json_repository_imp.dart';
import 'package:flutter_mvvm_getx/modules/main/view_models/main_viewModel.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MainViewModel(),fenix: true,
    );
    Get.lazyPut<JsonRepository>(
          () => JsonRepositoryImpl(),
      tag: (JsonRepository).toString(),
    );
  }
}

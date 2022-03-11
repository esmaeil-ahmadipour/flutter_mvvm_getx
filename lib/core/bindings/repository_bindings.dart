import 'package:flutter_mvvm_getx/data/repositories/json_repository.dart';
import 'package:flutter_mvvm_getx/data/repositories/json_repository_imp.dart';
import 'package:get/get.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JsonRepository>(
      () => JsonRepositoryImpl(),
      tag: (JsonRepository).toString(),
    );
  }
}
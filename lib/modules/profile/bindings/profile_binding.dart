import 'package:flutter_mvvm_getx/data/repositories/json_repository.dart';
import 'package:flutter_mvvm_getx/data/repositories/json_repository_imp.dart';
import 'package:flutter_mvvm_getx/modules/profile/view_models/profile_viewModel.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileViewModel(),
      fenix: true,
    );
    Get.lazyPut<JsonRepository>(
      () => JsonRepositoryImpl(),
      tag: (JsonRepository).toString(),
    );
  }
}

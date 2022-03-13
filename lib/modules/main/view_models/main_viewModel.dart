import 'package:flutter_mvvm_getx/core/models/ui_state.dart';
import 'package:flutter_mvvm_getx/core/models/user.dart';
import 'package:flutter_mvvm_getx/core/routes/app_pages.dart';
import 'package:flutter_mvvm_getx/data/repositories/json_repository.dart';
import 'package:get/get.dart';

class MainViewModel extends GetxController  {
  late Rx<UiState> uiState = const UiState.loading().obs ;
  late JsonRepository _repository;

  final User? argument = Get.arguments;
   getAllUsers() async {
    List<User> users = <User>[];
     uiState=const UiState.loading().obs;
     update();
     Future.delayed(const Duration(seconds: 5),(){
       uiState=const UiState.init().obs;
       update();
     }).whenComplete(() {
       uiState=const UiState.loading().obs;
       update();
     });

    try {
      users = await _repository.getUserList();
      uiState=UiState.success(users).obs;
      update();
    } catch (e) {
      uiState=UiState.error(e.toString()).obs;
      update();
    }
  }
  void navigateToProfilePage() {
    Get.toNamed(Routes.PROFILE, arguments:argument!.guid);
  }

  @override
  void onInit() {
    super.onInit();
    _repository = Get.find(tag: (JsonRepository).toString());
    getAllUsers();
   }
}

import 'dart:developer';

import 'package:flutter_mvvm_getx/core/models/ui_state.dart';
import 'package:flutter_mvvm_getx/core/models/user.dart';
import 'package:flutter_mvvm_getx/core/params/find_friend_params.dart';
import 'package:flutter_mvvm_getx/core/routes/app_pages.dart';
import 'package:flutter_mvvm_getx/data/repositories/json_repository.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  late JsonRepository _repository;
  late Rx<UiState> uiState = const UiState.init().obs ;

   String? argument;

  @override
  void onInit() {
    argument = Get.arguments;
    _repository = Get.find(tag: (JsonRepository).toString());
    super.onInit();
    findFriendByGuid(guid: argument!);
  }

  String convertRegisteredDate({required String registeredDate}) {
    if (registeredDate.substring(
            registeredDate.length - 3, registeredDate.length)[0] ==
        "-") {
      registeredDate =
          "${registeredDate.substring(0, registeredDate.length - 3)}${registeredDate.substring(registeredDate.length - 2, registeredDate.length)}";
    }
    DateTime dateTime = DateTime.parse(registeredDate);
    return "${dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour}:${dateTime.minute < 10 ? "0${dateTime.minute}" : "${dateTime.minute}"} ${dateTime.hour >= 12 ? 'PM' : 'AM'}";
  }

  findFriendByGuid({required String guid}) async {
    print("findFriendByGuid::::");
    print("guid:::::${guid}");

    User? user;
    uiState(const UiState.loading());
    update();
    Future.delayed(const Duration(seconds: 5), () {
    }).whenComplete(() {

    });

    try {
      print("START-->");

      user = await _repository.findFriend(params: FindFriendParams(
         guid:guid ));
      user = user!.copyWith(
        registered: convertRegisteredDate(registeredDate: user.registered!),
      );
      uiState(UiState.success([user]));
      update();
      // navigateToProfilePage(user: user!);
    } catch (e) {
      uiState(UiState.error(e.toString()));
      update();
      print("e:${e}");
    }
  }
  void navigateToProfilePage({/*User? user*/  String? guid}) {
    // print("uuuuu:${user!.name}");
argument=guid;
update();
    findFriendByGuid(guid: argument!);

    //
    // Future.delayed(Duration(milliseconds:100) ,(){
    //   Get.back();
    //
    //
    // }).whenComplete(() =>
    //     Get.toNamed(Routes.PROFILE, arguments:guid)
    //
    //
    // );
  }
}

import 'package:flutter_mvvm_getx/core/models/ui_state.dart';
import 'package:flutter_mvvm_getx/core/models/user.dart';
import 'package:flutter_mvvm_getx/core/params/search_email_params.dart';
import 'package:flutter_mvvm_getx/core/routes/app_pages.dart';
import 'package:flutter_mvvm_getx/data/repositories/json_repository.dart';
import 'package:flutter_mvvm_getx/utils/app_log.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  Rx<String> email = ''.obs;
  Rx<String> password = ''.obs;
  Rx<String> errorTextEmail = ''.obs;
  Rx<String> errorTextPassword = ''.obs;
  Rx<bool> submitEmail = false.obs;
  Rx<bool> submitPassword = false.obs;
  Rx<bool> buttonState = false.obs;
  late Rx<UiState> uiState = const UiState.init().obs;

  late JsonRepository _repository;

  @override
  void onInit() {
    errorTextEmail('');
    errorTextPassword('');
    submitEmail(false);
    submitPassword(false);
    super.onInit();
    _repository = Get.find(tag: (JsonRepository).toString());

    debounce(email, validationEmail,
        time: const Duration(milliseconds: 500));
    debounce(password, validationPassword,
        time: const Duration(milliseconds: 500));
  }

  ///  conditions for email checking ...
  bool filledOK(String val) {
    if (val == '') {
      errorTextEmail.value = 'لطفا ایمیل وارد شود';
      return false;
    }
    return true;
  }

  bool lengthOK(String val) {
    if (val.length > 255) {
      errorTextEmail.value = 'آدرس ایمیل نهایتا 255 کاراکتر باشد';
      return false;
    }
    return true;
  }

  bool checkStandardRegExp(String val) {
    if (!RegExp( // using basic regex helper.
        r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(val)) {
      errorTextEmail.value = 'آدرس ایمیل ناقص است.';
      return false;
    }
    return true;
  }

  bool latinEmailAddress(String val) {
    if (isNonLatinEmailAddress(val)) {
      errorTextEmail.value = 'آدرس ایمیل لاتین نمی باشد';
      return false;
    }
    return true;
  }

  bool checkStartAndEnd(String val) {
    if (val.split("@")[0].endsWith(".") || val.split("@")[0].startsWith(".")) {
      AppLog.i("message");
      errorTextEmail.value = 'آدرس ایمیل استاندارد نمی باشد';
      return false;
    }
    return true;
  }

  bool checkDuplicateAT(String val) {
    if (val
        .split("@")
        .length > 2) {
      AppLog.i("message");
      errorTextEmail.value = 'آدرس ایمیل استاندارد نمی باشد';
      return false;
    }
    return true;
  }

  bool isNonLatinEmailAddress(String text) {
    ///This Method is Helper ..
    text = text.replaceAll("@", "");
    text = text.replaceAll(".", "");
    for (var element in text.codeUnits) {
      if (!(element >= 65 && element <= 90) &&
          !(element >= 97 && element <= 122) &&
          !(element >= 48 && element <= 57)) {
        return true;
      }
    }
    return false;
  }

  ///  conditions for password checking
  bool isPasswordLengthOK(String val, {int minLen = 8}) {
    if (val.length < minLen) {
      errorTextPassword.value = 'پسورد باید حداقل 8 کاراکتر باشد';
      return false;
    }
    if (val.length > 255) {
      errorTextPassword.value = 'پسورد باید کوتاه تر باشد';
      return false;
    }
    errorTextPassword.value = '';
    return true;
  }

  bool isFilledPasswordOK(String val) {
    if (val == '') {
      errorTextPassword.value = 'این قسمت نباید خالی باشد';
      return false;
    }
    return true;
  }

  Future<bool> available(String val) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return true;
  }

  /// validation conditions list for textFormFields..
  void validationEmail(String val) async {
    errorTextEmail(""); // reset validation errors to nothing
    submitEmail(false); // disable submit while validating
    if (lengthOK(val) &&
        filledOK(val) &&
        checkStandardRegExp(val) &&
        latinEmailAddress(val) &&
        checkStartAndEnd(val) &&
        checkDuplicateAT(val) &&
        await available(val)) {
      submitEmail(true);
      errorTextEmail(null);
      buttonState(isSubmitDataSuccess());
    } else {
      submitEmail(false);
      buttonState(isSubmitDataSuccess());
    }
  }

  void validationPassword(String val) async {
    errorTextPassword(""); // reset validation errors to nothing
    submitPassword(false); // disable submit while validating
    if (isPasswordLengthOK(val) &&
        isFilledPasswordOK(val) &&
        await available(val)) {
      submitPassword(true);
      errorTextPassword(null);
      buttonState(isSubmitDataSuccess());
    } else {
      submitPassword(false);
      buttonState(isSubmitDataSuccess());
    }
  }

  /// check changes on textFormFields ...
  void emailChanged(String val) {
    if (val == '') {
      email(null);
    } else {}
    email.value = val;
  }

  void passwordChanged(String val) {
    if (val == '') {
      password(null);
    } else {}
    password.value = val;
  }

  /// check final combined result must be true to enable button .
  bool isSubmitDataSuccess() {
    if (submitPassword.value && submitEmail.value) {
      return true;
    } else {
      return false;
    }
  }

  loginRequest() async {
    print("loginRequest::::");

    User? user;
    uiState(const UiState.loading());
    Future.delayed(const Duration(seconds: 5), () {
      uiState(const UiState.init());
    }).whenComplete(() {
      uiState(const UiState.loading());
    });

    try {
      user = await _repository.loginRequest(params: SearchEmailParams(
          email: email.value, password: password.value));
      uiState(UiState.success([user]));
      navigateToMainPage(user: user!);
    } catch (e) {
      uiState(UiState.error(e.toString()));
      print("e:${e}");
    }
  }
}

void navigateToMainPage({required User user}) {
  Get.offAllNamed(Routes.MAIN, arguments:user);
}

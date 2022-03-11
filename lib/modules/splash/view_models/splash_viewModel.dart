import 'package:flutter_mvvm_getx/core/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashViewModel extends GetxController {
  showSplashAndNavigate() async {
    update();
    Future.delayed(const Duration(seconds: 5), () {
    }).whenComplete(() {
      Get.offAllNamed(Routes.MAIN);
    });
  }

  @override
  void onInit() {
    super.onInit();
    showSplashAndNavigate();
  }
}

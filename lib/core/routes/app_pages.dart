import 'package:flutter_mvvm_getx/modules/main/bindings/main_binding.dart';
import 'package:flutter_mvvm_getx/modules/splash/bindings/splash_binding.dart';
import 'package:flutter_mvvm_getx/modules/main/views/main_screen.dart';
import 'package:flutter_mvvm_getx/modules/splash/views/splash_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () =>  const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () =>  const MainScreen(),
      binding: MainBinding(),
    ),

  ];
}

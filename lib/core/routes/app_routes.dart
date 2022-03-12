part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const MAIN = _Paths.MAIN;
  static const LOGIN = _Paths.LOGIN;
  static const PROFILE = _Paths.PROFILE;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const MAIN = '/main';
  static const LOGIN = '/login';
  static const PROFILE = '/profile';
}

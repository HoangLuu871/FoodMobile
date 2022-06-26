part of 'app_pages.dart';

abstract class Routes {
  static const INITIAL = SPLASHSCREEN;

  static const SPLASHSCREEN = _Paths.SPLASHSCREEN;
  static const LOGIN = _Paths.LOGIN;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const MENUMANAGER = _Paths.MENUMANAGER;
  static const RESMANAGER = _Paths.RESMANAGER;
}

abstract class _Paths {
  static const SPLASHSCREEN = '/splashscreen';
  static const LOGIN = '/login';
  static const DASHBOARD = '/dashboard';
  static const MENUMANAGER = '/menumanager';
  static const RESMANAGER = '/resmanager';
}

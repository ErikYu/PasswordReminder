import 'package:fluro/fluro.dart';
import 'pages/password_list/password_list.dart';
import 'pages/password_detail/password_detail.dart';
import 'pages/setting/setting.dart';
import 'pages/lock_reset/lock_reset.dart';
import 'pages/export_import/export_import.dart';


class RootRoutes {
  static Router router;
  static String passwordList = '/password';
  static String passwordDetail = '/password/:id';
  static String setting = '/setting';
  static String lockReset = '/setting/lockreset';
  static String exportImport = '/setting/export_import';

  static void configureRoutes(Router router) {
    router.define(passwordList, handler: Handler(handlerFunc: (context, param) => PasswordListPage()));
    router.define(passwordDetail, handler: Handler(handlerFunc: (context, param) => PasswordDetailPage(id: param['id'][0])));
    router.define(setting, handler: Handler(handlerFunc: (context, param) => SettingPage()));
    router.define(lockReset, handler: Handler(handlerFunc: (context, param) => LockResetPage()));
    router.define(exportImport, handler: Handler(handlerFunc: (context, param) => ExportImport()));
    RootRoutes.router = router;
  }
}
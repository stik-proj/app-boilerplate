import 'package:app_boilerplate/presentations/views/home.dart';
import 'package:app_boilerplate/presentations/views/remote_config_test_view.dart';
import 'package:app_boilerplate/presentations/views/welcome_editor.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Routes {
  static const home = '/home';
  static const remoteConfigTest = '/remote_config_test';
  static const welcomeEditor = '/welcome_editor';

  static List<GetPage> pages = [
    GetPage(name: Routes.home, page: () => Home()),
    GetPage(name: Routes.remoteConfigTest, page: () => RemoteConfigTestView()),
    GetPage(name: Routes.welcomeEditor, page: () => WelcomeEditor()),
  ];
}

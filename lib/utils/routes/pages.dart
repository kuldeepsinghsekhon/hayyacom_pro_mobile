import 'package:get/get.dart';
import 'package:hayyacom/screens/login/binding.dart';
import 'package:hayyacom/screens/login/page.dart';

import 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
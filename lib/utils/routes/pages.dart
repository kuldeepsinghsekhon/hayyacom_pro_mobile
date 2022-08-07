import 'package:get/get.dart';
import 'package:hayyacom/screens/login/binding.dart';
import 'package:hayyacom/screens/login/page.dart';
import 'package:hayyacom/screens/new_inviter/binding.dart';
import 'package:hayyacom/screens/new_inviter/page.dart';

import 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.newInviter,
      page: () => const NewInviterView(),
      binding: NewInviterBinding(),
    ),
  ];
}
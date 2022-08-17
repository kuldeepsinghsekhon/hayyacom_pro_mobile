import 'package:get/get.dart';
import 'package:hayyacom/screens/login/binding.dart';
import 'package:hayyacom/screens/login/page.dart';
import 'package:hayyacom/screens/new_inviter/contact_detail/binding.dart';
import 'package:hayyacom/screens/new_inviter/contact_detail/page.dart';
import 'package:hayyacom/screens/new_inviter/contact_list/binding.dart';
import 'package:hayyacom/screens/new_inviter/contact_list/page.dart';
import 'package:hayyacom/screens/new_inviter/event_list/binding.dart';
import 'package:hayyacom/screens/new_inviter/event_list/page.dart';
import 'package:hayyacom/screens/user_selection/binding.dart';
import 'package:hayyacom/screens/user_selection/page.dart';

import 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.eventListing,
      page: () => const EventListingView(),
      binding: EventListingBinding(),
    ),
    GetPage(
      name: Routes.contactListing,
      page: () => const ContactListingView(),
      binding: ContactListingBinding(),
    ),
    GetPage(
      name: Routes.contactDetail,
      page: () => const ContactDetailView(),
      binding: ContactDetailBinding(),
    ),
    GetPage(
      name: Routes.userSelection,
      page: () => const UserSelectionView(),
      binding: UserSelectionBinding(),
    ),
  ];
}
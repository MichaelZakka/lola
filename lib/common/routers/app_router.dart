import 'package:get/get.dart';
import 'package:lola_app/features/cart/pages/cart_page.dart';
import 'package:lola_app/features/create_custom_cake/pages/create_custom_cake_page.dart';
import 'package:lola_app/features/home/pages/cake_details_page.dart';
import 'package:lola_app/features/home/pages/cakes_list_page.dart';
import 'package:lola_app/features/home/pages/home_page.dart';
import 'package:lola_app/features/main_layout/pages/nav_bar_page.dart';
import 'package:lola_app/features/settings/pages/edit_profile_page.dart';
import 'package:lola_app/features/settings/pages/history_page.dart';
import 'package:lola_app/features/settings/pages/settings_page.dart';

import '../../features/registration/pages/login_page.dart';
import '../../features/registration/pages/register_page.dart';

class AppRoute {
  static const loginPageUrl = "/login-page";
  static const registerPageUrl = "/register-page";
  static const navBarPageUrl = "/navbar-page";
  static const homePageUrl = "/home-page";
  static const cartPageUrl = "/cart-page";
  static const settingsPageUrl = "/settings-page";
  static const cakeDetailsPageUrl = "/cake-details-page";
  static const editProfilePageUrl = "/edit-profile-page";
  static const historyPageUrl = '/history-page';
  static const cakesListPage = '/cakes-list-page';
  static const createCustomCakePageUrl = '/create-custom-cake-page';

  static List<GetPage> pages = [
    GetPage(name: loginPageUrl, page: () => LoginPage()),
    GetPage(name: registerPageUrl, page: () => RegisterPage()),
    GetPage(name: navBarPageUrl, page: () => NavBarPage()),
    GetPage(name: homePageUrl, page: () => HomePage()),
    GetPage(name: cartPageUrl, page: () => CartPage()),
    GetPage(name: settingsPageUrl, page: () => SettingsPage()),
    GetPage(name: cakeDetailsPageUrl, page: () => CakeDetailsPage()),
    GetPage(name: editProfilePageUrl, page: () => EditProfilePage()),
    GetPage(name: historyPageUrl, page: () => HistoryPage()),
    GetPage(name: cakesListPage, page: () => CakesListPage()),
    GetPage(name: createCustomCakePageUrl, page: () => CreateCustomCakePage()),
  ];
}

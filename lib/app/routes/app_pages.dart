import 'package:get/get.dart';

import 'package:newsapp/app/modules/authenticationscreen/bindings/authenticationscreen_binding.dart';
import 'package:newsapp/app/modules/authenticationscreen/views/authenticationscreen_view.dart';
import 'package:newsapp/app/modules/forgotpassword/bindings/forgotpassword_binding.dart';
import 'package:newsapp/app/modules/forgotpassword/views/forgotpassword_view.dart';
import 'package:newsapp/app/modules/home/bindings/home_binding.dart';
import 'package:newsapp/app/modules/home/views/home_view.dart';
import 'package:newsapp/app/modules/loginscreen/bindings/loginscreen_binding.dart';
import 'package:newsapp/app/modules/loginscreen/views/loginscreen_view.dart';
import 'package:newsapp/app/modules/signupscreen/bindings/signupscreen_binding.dart';
import 'package:newsapp/app/modules/signupscreen/views/signupscreen_view.dart';
import 'package:newsapp/app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'package:newsapp/app/modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHENTICATIONSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATIONSCREEN,
      page: () => AuthenticationscreenView(),
      binding: AuthenticationscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGINSCREEN,
      page: () => LoginscreenView(),
      binding: LoginscreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUPSCREEN,
      page: () => SignupscreenView(),
      binding: SignupscreenBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORD,
      page: () => ForgotpasswordView(),
      binding: ForgotpasswordBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
  ];
}

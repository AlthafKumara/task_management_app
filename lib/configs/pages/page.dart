import 'package:get/get.dart';
import 'package:task_management_app/configs/routes/route.dart';
import 'package:task_management_app/features/auth/login/bindings/login_binding.dart';
import 'package:task_management_app/features/auth/login/view/ui/login_page.dart';
import 'package:task_management_app/features/auth/register/bindings/register_binding.dart';
import 'package:task_management_app/features/auth/register/view/ui/register_page.dart';
import 'package:task_management_app/features/auth/splash/bindings/splash_binding.dart';
import 'package:task_management_app/features/auth/splash/view/ui/splash_page.dart';
import 'package:task_management_app/features/home/bindings/home_binding.dart';
import 'package:task_management_app/features/home/view/ui/home_page.dart';

class CustomPage {
  CustomPage._();

  static const initial = CustomRoute.splash;

  static final routes = [
    GetPage(
      binding: SplashBinding(),
      name: CustomRoute.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      binding: LoginBinding(),
      name: CustomRoute.login,
      page: () => const LoginPage(),
    ),

    GetPage(
      binding: RegisterBinding(),
      name: CustomRoute.register,
      page: () => const RegisterPage(),
    ),

    GetPage(
      binding: HomeBinding(),
      name: CustomRoute.home,
      page: () => const HomePage(),
    ),
  ];
}

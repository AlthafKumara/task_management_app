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
import 'package:task_management_app/features/profile/bindings/profile_binding.dart';
import 'package:task_management_app/features/profile/view/ui/profile_page.dart';
import 'package:task_management_app/features/schedule/bindings/schedule_binding.dart';
import 'package:task_management_app/features/schedule/view/ui/schedule_page.dart';
import 'package:task_management_app/features/stats/bindings/stats_binding.dart';
import 'package:task_management_app/features/stats/view/ui/stats_page.dart';
import 'package:task_management_app/shared/bindings/global_bottom_nav_binding.dart';

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
      bindings: [HomeBinding(), GlobalBottomNavBinding()],
      name: CustomRoute.home,
      page: () => const HomePage(),
    ),
    GetPage(
      bindings: [StatsBinding(), GlobalBottomNavBinding()],
      name: CustomRoute.stats,
      page: () => const StatsPage(),
    ),
    GetPage(
      bindings: [ScheduleBinding(), GlobalBottomNavBinding()],
      name: CustomRoute.schedule,
      page: () => const SchedulePage(),
    ),
    GetPage(
      bindings: [ProfileBinding(), GlobalBottomNavBinding()],
      name: CustomRoute.profile,
      page: () => const ProfilePage(),
    ),
  ];
}

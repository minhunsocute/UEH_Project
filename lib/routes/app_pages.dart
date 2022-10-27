import 'package:get/get.dart';
import 'package:ueh_project/features/auth/screens/forget_password_screen.dart';
import 'package:ueh_project/features/auth/screens/sign_in_screen.dart';
import 'package:ueh_project/features/staff/dashboard/binding/dashboard_binding.dart';
import 'package:ueh_project/features/staff/dashboard/screens/dashboard_screen.dart';
import 'package:ueh_project/routes/route_name.dart';

import '../features/auth/screens/sign_up_screen.dart';
import '../features/splash_intro/screens/intro_screen.dart';
import '../features/splash_intro/screens/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => SplashScreen(),
      // binding: SplashB(),
    ),
    GetPage(
      name: RouteNames.introScreen,
      page: () => const IntroScreen(),
    ),
    GetPage(
      name: RouteNames.signInScreen,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: RouteNames.signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: RouteNames.forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
    ),
    GetPage(
      name: RouteNames.dashboardScreen,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
  ];
}

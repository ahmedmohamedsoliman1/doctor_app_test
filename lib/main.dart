import 'package:doctor_app_test/config/dependency_injection/dp.dart';
import 'package:doctor_app_test/config/prefs/prefs.dart';
import 'package:doctor_app_test/core/app_routes.dart';
import 'package:doctor_app_test/features/dashboard/dashboard_provider/dashboard_provider.dart';
import 'package:doctor_app_test/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:doctor_app_test/features/login/presentation/login_provider/login_provider.dart';
import 'package:doctor_app_test/features/login/presentation/screens/login_screen.dart';
import 'package:doctor_app_test/features/register/presentation/register_provider/register_provider.dart';
import 'package:doctor_app_test/features/register/presentation/screens/register_screen.dart';
import 'package:doctor_app_test/features/splash/presentation/screens/splash_screen.dart';
import 'package:doctor_app_test/features/splash/presentation/splash_provider/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async{
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => SplashProvider()) ,
    ChangeNotifierProvider(create: (context) => LoginProvider(loginImplRepo: Dp.getIt())) ,
    ChangeNotifierProvider(create: (context) => DashBoardProvider()),
    ChangeNotifierProvider(create: (context) => RegisterProvider(registerImplRepo: Dp.getIt()))
  ] ,
  child: const MyApp(),));

  Dp.setUp();
  InitPrefs.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: false,
        ),
        initialRoute: SplashScreen.route,
        routes: {
          AppRoutes.splashRoute : (context) => const SplashScreen(),
          AppRoutes.loginRoute : (context) => const LoginScreen(),
          AppRoutes.dashboardRoute : (context) => const DashBoardScreen() ,
          AppRoutes.registerRoute : (context) => const RegisterScreen(),

        },
      ),
    );
  }
}

import 'package:doctor_app_test/core/app_images.dart';
import 'package:doctor_app_test/core/app_routes.dart';
import 'package:doctor_app_test/features/splash/presentation/splash_provider/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_colors.dart';

class SplashScreen extends StatefulWidget {

  static const String route = AppRoutes.splashRoute ;


  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    navigate();
    super.initState();
  }

  navigate () {
    Provider.of<SplashProvider>(context , listen: false).navigateToDashBoard(context);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: AppColors.whiteColor,
              ),
              Center(child: SvgPicture.asset(AppImages.backLogo)) ,
              Center(child: Image(image: const AssetImage(AppImages.logoAppName) ,
              width: 270.w,
              height: 72.h,
              fit: BoxFit.fill,),)
            ],
          ),
        ));
  }
}

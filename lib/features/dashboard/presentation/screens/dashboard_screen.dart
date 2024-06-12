import 'package:doctor_app_test/core/app_images.dart';
import 'package:doctor_app_test/core/app_routes.dart';
import 'package:doctor_app_test/core/app_strings.dart';
import 'package:doctor_app_test/features/dashboard/dashboard_provider/dashboard_provider.dart';
import 'package:doctor_app_test/widgets/elevated_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_colors.dart';
import '../../../../widgets/text_widget.dart';

class DashBoardScreen extends StatefulWidget {

  static const String route = AppRoutes.dashboardRoute ;
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(height: 30.h,),
              Image(image: const AssetImage(AppImages.logoAppName) ,
              width: 140.w, height: 38.h,),
              SizedBox(height: 20.h,),
              Stack(
                children: [
                  SvgPicture.asset(AppImages.backLogo),
                  const Center(
                    child: Image(image: AssetImage(AppImages.doctor)),
                  ),
                  const Positioned(
                      bottom : 0 ,
                      child: Image(image: AssetImage(AppImages.effect))),
                  Positioned(
                    bottom : 0 ,
                    left: 0 ,
                    right: 0,
                    child : customText(
                      h: 1.5,
                      color : AppColors.primaryColor,
                      text: AppStrings.bestDoctor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700 ,
                    )
                  )
                ],
              ) ,
              SizedBox(height: 30.h,),
              customText(
                h: 1.5,
                color : AppColors.darkGrey,
                text: AppStrings.manageAndSch,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400 ,
              ),
              SizedBox(height: 30.h,),
              SizedBox(
                width: 311.w,
                child: customButton(
                    onPressed: () {
                       context.read<DashBoardProvider>().navigateToLogin(context);
                    },
                    child: customText(
                        text: AppStrings.getStarted,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor),
                    backGroundColor: AppColors.primaryColor),
              )
            ],
          ),
        ));
  }
}

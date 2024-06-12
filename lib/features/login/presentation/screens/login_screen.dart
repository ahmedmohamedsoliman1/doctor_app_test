import 'package:doctor_app_test/core/app_colors.dart';
import 'package:doctor_app_test/core/app_images.dart';
import 'package:doctor_app_test/core/app_routes.dart';
import 'package:doctor_app_test/features/login/presentation/login_provider/login_provider.dart';
import 'package:doctor_app_test/widgets/text_form_field_widget.dart';
import 'package:doctor_app_test/widgets/text_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_strings.dart';
import '../../../../widgets/elevated_button_widget.dart';

class LoginScreen extends StatefulWidget {

  static const String route = AppRoutes.loginRoute ;

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: context.read<LoginProvider>().formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h,),
                    customText(
                        text: AppStrings.welcomeBack,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor),
                    SizedBox(height: 15.h,),
                    customText(
                        text: AppStrings.weAreExc,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkGrey ,
                        textAlign: TextAlign.start),
                    SizedBox(height: 15.h,),
                    customAppTextField(
                      controller: context.read<LoginProvider>().emailController,
                        hint: AppStrings.email,
                        onChanged: (input) {
                          context.read<LoginProvider>().equalEmail(input);
                        },
                        validator: (input) {
                        if (input == null || input.trim().isEmpty){
                          return "Please email required" ;
                        }else {
                          return null ;
                        }

                        }),
                    SizedBox(height: 15.h,),
                    customAppTextField(
                      obscure: true,
                        controller: context.read<LoginProvider>().passwordController,
                        hint: AppStrings.password,
                        onChanged: (input) {
                          context.read<LoginProvider>().equalPassword(input);
                        },
                        validator: (input) {
                          if (input == null || input.trim().isEmpty){
                            return "Please password required" ;
                          }else {
                            if ( 8 > input.length){
                              return "Password is too short";
                          }else {
                              print(input.length);
                            return null ;
                          }
                        }}) ,
                    SizedBox(height: 15.h,),
                    Row(
                      children: [
                        Consumer<LoginProvider>(
                            builder: (context , provider , _) {
                              return Checkbox(value:context.read<LoginProvider>().checked , onChanged: (value) {
                                context.read<LoginProvider>().equalCheck(value!);
                              });
                            }),
                        customText(
                            text: AppStrings.rememberMe,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightGrey),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    Consumer<LoginProvider>(
                        builder: (context , provider , _) {
                          if (provider.isLoginLoading){
                            return  SizedBox(
                              width: 311.w,
                              child: customButton(
                                  onPressed: () {},
                                  child: const Center(child: CircularProgressIndicator(
                                    color: AppColors.whiteColor,
                                    strokeWidth: 2,
                                  ),),
                                  backGroundColor: AppColors.primaryColor),
                            );
                          }else {
                            return SizedBox(
                              width: 311.w,
                              child: customButton(
                                  onPressed: () {
                                    context.read<LoginProvider>().login(context);
                                  },
                                  child: customText(
                                      text: AppStrings.login,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.whiteColor),
                                  backGroundColor: AppColors.primaryColor),
                            );
                          }
                        }),
                    SizedBox(height: 30.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1.h ,
                          color: AppColors.lightGrey,
                          width: 110.w,
                        ),
                        customText(
                            text: "Or sign in with",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightGrey),
                        Container(
                          height: 1.h ,
                          color: AppColors.lightGrey,
                          width: 110.w,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: const AssetImage(AppImages.google) ,
                        width: 46.w, height: 46.h,),
                        Image(image: const AssetImage(AppImages.facebook) ,
                          width: 46.w, height: 46.h,),
                        Image(image: const AssetImage(AppImages.twitter) ,
                          width: 46.w, height: 46.h,),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    RichText(
                      textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "By logging, you agree to our " ,
                              style: TextStyle(
                                fontWeight: FontWeight.w400 ,
                                fontSize: 14.sp ,
                                color: AppColors.lightGrey
                              )
                            ),
                            TextSpan(
                                text: "Terms & Conditions " ,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500 ,
                                    fontSize: 14.sp ,
                                    color: AppColors.blackColor
                                )
                            ),
                            TextSpan(
                                text: "and " ,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400 ,
                                    fontSize: 14.sp ,
                                    color: AppColors.lightGrey
                                )
                            ),
                            TextSpan(
                                text: "PrivacyPolicy" ,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400 ,
                                    fontSize: 14.sp ,
                                    color: AppColors.blackColor
                                )
                            )
                          ]
                        )),
                    SizedBox(height: 30.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Already have an account yet? " ,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400 ,
                                          fontSize: 15.sp ,
                                          color: AppColors.darkGrey
                                      )
                                  ),
                                  TextSpan(
                                      text: "Sign Up " ,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500 ,
                                          fontSize: 15.sp ,
                                          color: AppColors.primaryColor
                                      )
                                  )
                                ]
                            )),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

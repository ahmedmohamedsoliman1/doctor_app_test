import 'package:doctor_app_test/config/extentions/navigate_extension.dart';
import 'package:doctor_app_test/core/app_colors.dart';
import 'package:doctor_app_test/core/app_images.dart';
import 'package:doctor_app_test/core/app_routes.dart';
import 'package:doctor_app_test/features/register/presentation/register_provider/register_provider.dart';
import 'package:doctor_app_test/widgets/text_form_field_widget.dart';
import 'package:doctor_app_test/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_strings.dart';
import '../../../../widgets/elevated_button_widget.dart';

class RegisterScreen extends StatefulWidget {

  static const String route = AppRoutes.registerRoute ;

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: context.read<RegisterProvider>().formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h,),
                    customText(
                        text: AppStrings.createAccount,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor),
                    SizedBox(height: 15.h,),
                    customText(
                        text: AppStrings.signUpNow,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkGrey ,
                        textAlign: TextAlign.start),
                    SizedBox(height: 15.h,),
                    customAppTextField(
                        controller: context.read<RegisterProvider>().nameController,
                        hint: AppStrings.name,
                        onChanged: (input) {
                          context.read<RegisterProvider>().equalName(input);
                        },
                        validator: (input) {
                          if (input == null || input.trim().isEmpty){
                            return "Please name required" ;
                          }else {
                            return null ;
                          }

                        }),
                    SizedBox(height: 15.h,),
                    customAppTextField(
                        controller: context.read<RegisterProvider>().emailController,
                        hint: AppStrings.email,
                        onChanged: (input) {
                          context.read<RegisterProvider>().equalEmail(input);
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
                        controller: context.read<RegisterProvider>().passwordController,
                        hint: AppStrings.password,
                        onChanged: (input) {
                          context.read<RegisterProvider>().equalPassword(input);
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
                    customAppTextField(
                        controller: context.read<RegisterProvider>().passwordConfirmationController,
                        hint: AppStrings.password,
                        onChanged: (input) {
                          context.read<RegisterProvider>().equalPasswordConfirm(input);
                        },
                        validator: (input) {
                          if (input == null || input.trim().isEmpty){
                            return "Please password confirmation required" ;
                          }else {
                            if ( context.read<RegisterProvider>().passwordConfirmationController.text !=
                                context.read<RegisterProvider>().passwordController.text){
                              return "Password is not matching";
                            }else {
                              print(input.length);
                              return null ;
                            }
                          }}) ,
                    SizedBox(height: 15.h,),
                    IntlPhoneField(
                      validator: (input) {
                        if (input == null || input.number.trim().isEmpty){
                          return "Please phone required" ;
                        }else {
                          return null ;
                        }
                      },
                      controller: context.read<RegisterProvider>().phoneController,
                      decoration: const InputDecoration(
                        hintText: 'Phone',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'EG',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                        context.read<RegisterProvider>().equalPhone(phone.number);
                        context.read<RegisterProvider>().equalCode(phone.countryCode);
                      },
                    ),
                    SizedBox(height: 30.h,),
                    Consumer<RegisterProvider>(
                        builder: (context , provider , _) {
                          if (provider.isRegisterLoading){
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
                                    context.read<RegisterProvider>().register(context);
                                  },
                                  child: customText(
                                      text: AppStrings.createAccount,
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
                        InkWell(
                          onTap: () {
                            context.pop(context);
                          },
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: AppStrings.haveAnAccount,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400 ,
                                            fontSize: 15.sp ,
                                            color: AppColors.darkGrey
                                        )
                                    ),
                                    TextSpan(
                                        text: "Sign In " ,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500 ,
                                            fontSize: 15.sp ,
                                            color: AppColors.primaryColor
                                        )
                                    )
                                  ]
                              )),
                        ),
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

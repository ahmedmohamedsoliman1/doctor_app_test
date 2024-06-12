import 'package:doctor_app_test/config/network/error_handler_model.dart';
import 'package:doctor_app_test/features/login/data/model/login_response_failed.dart';
import 'package:doctor_app_test/features/login/data/model/login_response_model.dart';
import 'package:either_dart/either.dart';

abstract class LoginRepo {

  Future <Either<LoginResponseError , LoginResponse>> login ({required String email , required String password}) ;
}
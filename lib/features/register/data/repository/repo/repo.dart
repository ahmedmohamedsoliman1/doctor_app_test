import 'package:doctor_app_test/features/register/data/models/register_model_success.dart';
import 'package:doctor_app_test/features/register/data/models/register_response_failed.dart';
import 'package:either_dart/either.dart';

abstract class RegisterRepo {

  Future <Either<RegisterResponseError , RegisterResponse>> register ({required String email , required String password , required String phone ,
  required String gender , required String passwordConfirmation ,
  required String name});
}
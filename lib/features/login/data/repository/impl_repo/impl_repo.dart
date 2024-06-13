import 'package:dio/dio.dart';
import 'package:doctor_app_test/config/internet_connection/check_connection.dart';
import 'package:doctor_app_test/config/network/api_client.dart';
import 'package:doctor_app_test/config/network/api_constants.dart';
import 'package:doctor_app_test/features/login/data/model/login_response_failed.dart';
import 'package:doctor_app_test/features/login/data/model/login_response_model.dart';
import 'package:doctor_app_test/features/login/data/repository/respo/repo.dart';
import 'package:either_dart/src/either.dart';

class LoginImplRepo implements LoginRepo{

  ApiClient apiClient ;

  LoginImplRepo ({required this.apiClient});

  @override
  Future<Either <LoginResponseError , LoginResponse>> login({required String email, required String password}) async{
     var url = ApiConstants.login;
     if (await checkConnection()){
       try {
         var response = await apiClient.post(url: url ,
             body: {"email" : email , "password" : password} ,
             isFormData: true);
         if (response.statusCode == 200){
           return Right(LoginResponse.fromJson(response.data));
         }else {
           return Left(LoginResponseError.fromJson({
             "message" : response.statusMessage ,
             "status" : false,
             "data" : [],
             "code" : 401
           }));
         }
       }catch (e){
         return Left(LoginResponseError.fromJson({
           "message" : e.toString() ,
           "status" : false,
           "data" : [],
           "code" : 401
         }));
     }

     }else {
       return Left(LoginResponseError.fromJson({
         "message" : "No Internet Connection" ,
         "status" : false,
         "data" : [],
         "code" : 401
       }));
     }
  }

}
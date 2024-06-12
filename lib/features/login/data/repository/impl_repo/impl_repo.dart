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
     try {
       var response = await apiClient.post(url: url ,
           body: {"email" : email , "password" : password} ,
       isFormData: true);
       return Right(LoginResponse.fromJson(response.data));
     }catch (e){
       return Left(LoginResponseError.fromJson({
         "message" : "Credentials doesn`t match our records" ,
         "status" : false,
         "data" : [],
         "code" : 401
       }));
     }
  }

}
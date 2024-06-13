import 'package:doctor_app_test/config/internet_connection/check_connection.dart';
import 'package:doctor_app_test/config/network/api_client.dart';
import 'package:doctor_app_test/config/network/api_constants.dart';
import 'package:doctor_app_test/features/register/data/models/register_model_success.dart';
import 'package:doctor_app_test/features/register/data/models/register_response_failed.dart';
import 'package:doctor_app_test/features/register/data/repository/repo/repo.dart';
import 'package:either_dart/src/either.dart';

class RegisterImplRepo implements RegisterRepo {
  
  ApiClient apiClient ;
  
  RegisterImplRepo ({required this.apiClient});
  @override
  Future<Either<RegisterResponseError, RegisterResponse>> register({
    required String email, required String password, required String phone ,
  required String gender , required String passwordConfirmation , required String name}) async{
    var url = ApiConstants.register ;
    if (await checkConnection()){
      try {
        var response = await apiClient.post(url: url , isFormData: true ,
        body: {
          "name" : name,
          "email" : email ,
          "password" : password ,
          "phone" : phone ,
          "gender" : gender ,
          "password_confirmation" : passwordConfirmation
        });
        if (response.statusCode == 200){
          return Right(RegisterResponse.fromJson(response.data));
        }else {
          return Left(RegisterResponseError.fromJson({
            "message": "Un processable Entity",
            "data": {
              "email": [
                "The email has already been taken."
              ],
              "phone": [
                "The phone has already been taken."
              ]
            },
            "status": false,
            "code": 422
          }));
        }
      }catch (e) {
        return Left(RegisterResponseError.fromJson({
          "message": e.toString(),
          "data": {
            "email": [
              ""
            ],
            "phone": [
              ""
            ]
          },
          "status": false,
          "code": 422
        }));
      }
    }else {
      return Left(RegisterResponseError.fromJson({
        "message": "No Internet Connection",
        "data": {
          "email": [
            ""
          ],
          "phone": [
            ""
          ]
        },
        "status": false,
        "code": 422
      }));
    }
  }
  
}
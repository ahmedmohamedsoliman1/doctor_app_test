import 'package:dio/dio.dart';

class ApiClient {
  Dio dio;

  ApiClient ({required this.dio});

  Future<Response> post ({
    required String url ,
   Map <String , dynamic> ? body,
   bool isFormData = true}){
    print("request body is : $body");
    FormData formData = FormData.fromMap(body!);
    return dio.post(url , data: isFormData? formData : body ,
    options: Options(
      validateStatus: (_) => true,
        contentType: 'application/json',
        headers: {'accept': 'application/json'}
    ));
  }

  Future <Response> get ({
    required String url
}) {
    return dio.get(url ,
    options: Options(
      validateStatus: (_)=> true,
        contentType: 'application/json',
        headers: {'accept': 'application/json'}
    ));
  }

  Future <Response> delete ({
    required String url ,
    Map<String , dynamic> ? body ,
    bool isFormData = true
}) {
    print("request body is : $body");
    FormData formData = FormData.fromMap(body!);
    return dio.delete(url , data: isFormData? formData : body ,
    options: Options(
        contentType: 'application/json',
        headers: {'accept': 'application/json'}
    ));
  }
}
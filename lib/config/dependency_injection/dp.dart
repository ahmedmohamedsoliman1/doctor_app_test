import 'package:dio/dio.dart';
import 'package:doctor_app_test/config/network/api_client.dart';
import 'package:doctor_app_test/features/login/data/repository/impl_repo/impl_repo.dart';
import 'package:doctor_app_test/features/login/presentation/login_provider/login_provider.dart';
import 'package:get_it/get_it.dart';

class Dp {

  static GetIt getIt = GetIt.instance ;

  static void setUp () {
    Dio dio = Dio() ;

    getIt.registerLazySingleton<ApiClient>(() => ApiClient(dio: dio));

    getIt.registerLazySingleton<LoginImplRepo>(() => LoginImplRepo(apiClient: getIt()));

    getIt.registerLazySingleton<LoginProvider>(() => LoginProvider(loginImplRepo: getIt()));

  }
}
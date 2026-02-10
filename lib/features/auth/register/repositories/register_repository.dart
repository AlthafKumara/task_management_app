import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:task_management_app/configs/data/api/dio_conf.dart';
import 'package:task_management_app/configs/data/local/drift/app_database.dart';
import 'package:task_management_app/configs/data/local/drift/daos/auth_dao.dart';
import 'package:task_management_app/configs/data/local/drift/daos/user_dao.dart';
import 'package:task_management_app/configs/data/local/local_secure_storage.dart';
import 'package:task_management_app/constants/api_constant.dart';
import 'package:task_management_app/features/auth/register/models/register_model.dart';
import 'package:task_management_app/shared/models/api_response_model.dart';

class RegisterRepository {
  final LocalSecureStorage localSecureStorage;
  final UserDao userDao;
  final AuthDao authDao;
  final dio = DioConf.dio;

  RegisterRepository({
    required this.userDao,
    required this.authDao,
    required this.localSecureStorage,
  });

  Future<ApiResponse<RegisterModel?>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "${ApiConstant.auth}/register",
        data: RegisterModel(
          name: name,
          email: email,
          password: password,
        ).toJson(),
      );
      final responseData = ApiResponse<RegisterModel>.fromJson(
        response.data,
        (json) => RegisterModel.fromJson(json),
      );

      await localSecureStorage.saveToken(responseData.data!.token!);


      await authDao.insertSession(
        AuthSessionCompanion(
          id: Value(responseData.data!.id!),
          accessToken: Value(responseData.data!.token!),
          userId: Value(responseData.data!.id!),
          lastLogin: Value(DateTime.now()),
          isLoggedIn: Value(true),
        ),
      );

      
      await userDao.deleteAllUser();
      await userDao.insertUser(
        UserCompanion(
          id: Value(responseData.data!.id!),
          name: Value(responseData.data!.name!),
          email: Value(responseData.data!.email!),
          createdAt: Value(DateTime.now().toIso8601String()),
        ),
      );

      return responseData;
    } on DioException catch (e) {
      if (e.response?.data != null) {
        return ApiResponse<RegisterModel?>.fromJson(
          e.response!.data,
          (_) => null,
        );
      }
      throw Exception("Network error");
    }
  }
}

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:task_management_app/configs/data/api/dio_conf.dart';
import 'package:task_management_app/configs/data/local/drift/app_database.dart';
import 'package:task_management_app/configs/data/local/drift/daos/auth_dao.dart';
import 'package:task_management_app/configs/data/local/drift/daos/user_dao.dart';
import 'package:task_management_app/configs/data/local/local_secure_storage.dart';
import 'package:task_management_app/constants/api_constant.dart';
import 'package:task_management_app/features/auth/login/models/login_model.dart';
import 'package:task_management_app/shared/models/api_response_model.dart';

class LoginRepository {
  final AuthDao authDao;
  final UserDao userDao;
  final LocalSecureStorage localSecureStorage;
  final dio = DioConf.dio;

  LoginRepository({
    required this.authDao,
    required this.userDao,
    required this.localSecureStorage,
  });

  Future<ApiResponse<LoginModel?>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "${ApiConstant.auth}/login",
        data: LoginModel(email: email, password: password).toJson(),
      );
      final responseData = ApiResponse<LoginModel>.fromJson(
        response.data,
        (json) => LoginModel.fromJson(json),
      );
      await localSecureStorage.saveToken(responseData.data!.token!);
      await authDao.deleteAllSession();
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
          isSynced: Value(true),
          createdAt: Value(DateTime.now().toIso8601String()),
        ),
      );

      return responseData;
    } on DioException catch (e) {
      if (e.response?.data != null) {
        return ApiResponse<LoginModel?>.fromJson(e.response!.data, (_) => null);
      }
      throw Exception("Network error");
    }
  }
}

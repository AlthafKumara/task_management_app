import 'package:dio/dio.dart';
import 'package:task_management_app/configs/data/api/dio_conf.dart';
import 'package:task_management_app/configs/data/local/drift/daos/auth_dao.dart';
import 'package:task_management_app/configs/data/local/drift/daos/user_dao.dart';
import 'package:task_management_app/configs/data/local/local_secure_storage.dart';
import 'package:task_management_app/constants/api_constant.dart';
import 'package:task_management_app/shared/models/api_response_model.dart';

class LogoutRepository {
  final AuthDao authDao;
  final UserDao userDao;
  final LocalSecureStorage localSecureStorage;
  final dio = DioConf.dio;

  LogoutRepository({
    required this.authDao,
    required this.userDao,
    required this.localSecureStorage,
  });

  Future<ApiResponse> logout() async {
    try {
      final token = await localSecureStorage.getToken();
      if (token == null) {
        return ApiResponse<void>(message: "Token not found", status: "error");
      }
      final response = await dio.post(
        "${ApiConstant.auth}/logout",
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final responseData = ApiResponse<void>.fromJson(response.data, (_) {});

      await authDao.deleteAllSession();
      await userDao.deleteAllUser();
      await localSecureStorage.deleteToken();

      return responseData;
    } on DioException catch (e) {
      if (e.response?.data != null) {
        return ApiResponse<void>.fromJson(e.response!.data, (_) {});
      }
      throw Exception("Network error");
    }
  }
}

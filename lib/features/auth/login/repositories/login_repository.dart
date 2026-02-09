import 'package:dio/dio.dart';
import 'package:task_management_app/configs/api/dio_conf.dart';
import 'package:task_management_app/constants/api_constant.dart';
import 'package:task_management_app/features/auth/login/models/login_model.dart';
import 'package:task_management_app/shared/models/api_response_model.dart';

class LoginRepository {
  final dio = DioConf.dio;

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
      return responseData;
    } on DioException catch (e) {
      if (e.response?.data != null) {
        return ApiResponse<LoginModel?>.fromJson(e.response!.data, (_) => null);
      }
      throw Exception("Network error");
    }
  }
}

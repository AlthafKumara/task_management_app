import 'package:dio/dio.dart';
import 'package:task_management_app/configs/api/dio_conf.dart';
import 'package:task_management_app/constants/api_constant.dart';
import 'package:task_management_app/features/auth/register/models/register_model.dart';
import 'package:task_management_app/shared/models/api_response_model.dart';

class RegisterRepository {
  final dio = DioConf.dio;

  Future<ApiResponse<RegisterModel?>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "${ApiConstant.auth}/register",
        data: RegisterModel(name: name, email: email, password: password).toJson(),
      );
      final responseData = ApiResponse<RegisterModel>.fromJson(
        response.data,
        (json) => RegisterModel.fromJson(json),
      );
      return responseData;
    } on DioException catch (e) {
      if (e.response?.data != null) {
        return ApiResponse<RegisterModel?>.fromJson(e.response!.data, (_) => null);
      }
      throw Exception("Network error");
    }
  }
}
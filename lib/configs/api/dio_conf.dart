import 'package:dio/dio.dart';
import 'package:task_management_app/constants/api_constant.dart';

class DioConf {
  static Dio? _dio;

  static Dio get dio {
    if (_dio != null) return _dio!;

    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        responseType: ResponseType.json,
      ),
    );

    _dio!.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );

    return _dio!;
  }
}

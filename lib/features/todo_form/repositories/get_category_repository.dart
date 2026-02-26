import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:task_management_app/configs/data/api/dio_conf.dart';
import 'package:task_management_app/configs/data/local/drift/app_database.dart';
import 'package:task_management_app/configs/data/local/drift/daos/category_dao.dart';
import 'package:task_management_app/configs/data/local/local_secure_storage.dart';
import 'package:task_management_app/configs/network/network_checker.dart';
import 'package:task_management_app/constants/api_constant.dart';
import 'package:task_management_app/shared/models/api_response_model.dart';
import 'package:task_management_app/shared/models/global_category_model.dart';
import 'package:task_management_app/utils/enums/api_status_enum.dart';

class GetCategoryRepository {
  final CategoryDao categoryDao;
  final NetworkChecker networkChecker;
  final LocalSecureStorage localSecureStorage;

  final dio = DioConf.dio;

  GetCategoryRepository({
    required this.categoryDao,
    required this.localSecureStorage,
    required this.networkChecker,
  });

  Future<List<CategoryModel>> getCategory() async {
    try {
      if (await networkChecker.isConnected) {
        try {
          final responseRemote = await remoteGetCategory();

          if (responseRemote.status == ApiStatus.success.name &&
              responseRemote.data != null) {
            await syncCategoryToLocal(responseRemote.data!);
          }
        } catch (e) {
          // If online but API fails, ignore error and keep local data
        }
      }

      final localCategories = await categoryDao.getCategory();
      return localCategories
          .where((e) => e != null)
          .map((e) => CategoryModel(id: e!.serverId, name: e.name))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<List<CategoryModel>>> remoteGetCategory() async {
    try {
      final token = await localSecureStorage.getToken();
      final response = await dio.get(
        ApiConstant.categories,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return ApiResponse<List<CategoryModel>>.fromJson(
        response.data,
        (json) => (json as List).map((e) => CategoryModel.fromJson(e)).toList(),
      );
    } on DioException catch (e) {
      if (e.response?.data != null) {
        return ApiResponse<List<CategoryModel>>.fromJson(
          e.response!.data,
          (_) => [],
        );
      }
      throw Exception("Network error");
    }
  }

  Future<void> syncCategoryToLocal(List<CategoryModel> categories) async {
    try {
      final companions = categories
          .map(
            (cat) => CategoryCompanion(
              serverId: Value(cat.id),
              name: Value(cat.name),
            ),
          )
          .toList();

      await categoryDao.replaceCategories(companions);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

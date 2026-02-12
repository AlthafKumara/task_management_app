import 'package:dio/dio.dart';
import 'package:task_management_app/configs/data/api/dio_conf.dart';
import 'package:task_management_app/configs/data/local/drift/app_database.dart';
import 'package:task_management_app/configs/data/local/drift/daos/user_dao.dart';
import 'package:task_management_app/configs/data/local/local_secure_storage.dart';
import 'package:task_management_app/configs/network/network_checker.dart';
import 'package:task_management_app/constants/api_constant.dart';
import 'package:task_management_app/features/profile/models/update_profile_model.dart';
import 'package:task_management_app/shared/models/api_response_model.dart';
import 'package:task_management_app/shared/models/global_user_model.dart';
import 'package:task_management_app/utils/enums/api_status_enum.dart';

class UpdateProfileRepository {
  final UserDao userDao;
  final NetworkChecker networkChecker;
  final LocalSecureStorage localSecureStorage;

  final dio = DioConf.dio;

  UpdateProfileRepository({
    required this.userDao,
    required this.networkChecker,
    required this.localSecureStorage,
  });

  Future<UserModel> updateProfile(UserModel model) async {
    try {
      if (await networkChecker.isConnected) {
        final responseRemote = await remoteUpdateProfile(
          UpdateProfileModel(name: model.name, email: model.email),
        );

        if (responseRemote.status == ApiStatus.fail.name) {
          throw Exception(responseRemote.message);
        }

        await localUpdateProfile(
          model.id,
          UserData(
            id: model.id,
            name: model.name!,
            email: model.email!,
            createdAt: model.createdAt!,
            isSynced: true,
          ),
        );

        return model.copyWith(isSynced: true);
      } else {
        await localUpdateProfile(
          model.id,
          UserData(
            id: model.id,
            name: model.name!,
            email: model.email!,
            createdAt: model.createdAt!,
            isSynced: false,
          ),
        );

        return model.copyWith(isSynced: false);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<UpdateProfileModel?>> remoteUpdateProfile(
    UpdateProfileModel? model
  ) async {
    try {
      final token = await localSecureStorage.getToken();
      final response = await dio.put(
        '${ApiConstant.auth}/profile',
        data: UpdateProfileModel(name: model?.name, email: model?.email).toJson(),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return ApiResponse<UpdateProfileModel?>.fromJson(
        response.data,
        (json) => UpdateProfileModel.fromJson(json),
      );
    } on DioException catch (e) {
      if (e.response?.data != null) {
        return ApiResponse<UpdateProfileModel?>.fromJson(
          e.response!.data,
          (_) => null,
        );
      }
      throw Exception("Network error");
    }
  }

  Future<void> localUpdateProfile(
    String id,
    UserData? data
  ) async {
    try {
      final user = await userDao.getUserById(id);
      if (user == null) {
        throw Exception('User not found');
      }

      final userData = UserData(
        id: user.id,
        name: data?.name ?? user.name,
        email: data?.email ?? user.email,
        createdAt: user.createdAt,
        isSynced: data?.isSynced ?? user.isSynced,
      );

      await userDao.updateUser(userData);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

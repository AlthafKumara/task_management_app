import 'package:task_management_app/configs/data/local/drift/daos/user_dao.dart';
import 'package:task_management_app/shared/models/global_user_model.dart';

class GlobalGetUserById {
  final UserDao userDao;

  GlobalGetUserById({required this.userDao});

  Future<UserModel?> getUserById(String id) async {
    final localUser = await userDao.getUserById(id);

    if (localUser == null) {
      return null;
    }
    final model = UserModel(
      id: localUser.id,
      name: localUser.name,
      email: localUser.email,
      createdAt: localUser.createdAt, );

    return model;
  }

  Stream<UserModel?> watchUserById(String id) {
    return userDao.watchUserById(id).map((localUser) {
      if (localUser == null) return null;

      return UserModel(
        id: localUser.id,
        name: localUser.name,
        email: localUser.email,
        createdAt: localUser.createdAt,
        isSynced: localUser.isSynced,
      );
    });
  }
}

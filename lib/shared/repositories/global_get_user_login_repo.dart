import 'package:task_management_app/configs/data/local/drift/daos/auth_dao.dart';

class GlobalGetUserLogin {
  final AuthDao authDao;

  GlobalGetUserLogin({required this.authDao});

  Future<String?> getUserId() async {
    final user = await authDao.getActiveSession();
    if (user == null) {
      return null;
    }
    return user.userId;
  }
}
import 'package:task_management_app/configs/data/local/drift/daos/auth_dao.dart';
import 'package:task_management_app/configs/data/local/drift/daos/user_dao.dart';

class SplashRepository {
  final AuthDao authDao;
  final UserDao userDao;

  SplashRepository({required this.authDao, required this.userDao});

  Future<bool> checkSession() async {
    final user = await authDao.getActiveSession();

    if (user == null) {
      return false;
    }
    return true;
  }
}

import 'package:get/get.dart';
import 'package:task_management_app/shared/models/global_user_model.dart';

class GlobalUserController extends GetxController{
  final user = Rxn<UserModel>();

  void setUser(UserModel data){
    user.value = data;
  }
  
}
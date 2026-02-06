import 'package:get/get.dart';
import 'package:task_management_app/configs/localizations/lang/en_us.dart';
import 'package:task_management_app/configs/localizations/lang/id_id.dart';

class AppLocale extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUs, 'id_ID': idId};
}

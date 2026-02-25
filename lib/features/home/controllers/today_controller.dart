import 'package:get/get.dart';
import 'package:task_management_app/configs/localizations/lang_keys.dart';

class TodayController extends GetxController {
  final _now = DateTime.now().obs;

  String get dayName => _getDayName(_now.value.weekday).tr;
  String get monthName => _getMonthName(_now.value.month).tr;
  String get date => _now.value.day.toString();
  String get year => _now.value.year.toString();

  String _getDayName(int day) {
    switch (day) {
      case DateTime.monday:
        return LangKeys.monday;
      case DateTime.tuesday:
        return LangKeys.tuesday;
      case DateTime.wednesday:
        return LangKeys.wednesday;
      case DateTime.thursday:
        return LangKeys.thursday;
      case DateTime.friday:
        return LangKeys.friday;
      case DateTime.saturday:
        return LangKeys.saturday;
      case DateTime.sunday:
        return LangKeys.sunday;
      default:
        return '';
    }
  }

  String _getMonthName(int month) {
    switch (month) {
      case DateTime.january:
        return LangKeys.january;
      case DateTime.february:
        return LangKeys.february;
      case DateTime.march:
        return LangKeys.march;
      case DateTime.april:
        return LangKeys.april;
      case DateTime.may:
        return LangKeys.may;
      case DateTime.june:
        return LangKeys.june;
      case DateTime.july:
        return LangKeys.july;
      case DateTime.august:
        return LangKeys.august;
      case DateTime.september:
        return LangKeys.september;
      case DateTime.october:
        return LangKeys.october;
      case DateTime.november:
        return LangKeys.november;
      case DateTime.december:
        return LangKeys.december;
      default:
        return '';
    }
  }

  void refreshDate() {
    _now.value = DateTime.now();
  }
}

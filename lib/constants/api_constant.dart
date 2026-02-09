import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstant {
  ApiConstant._();

  static final String baseUrl = dotenv.env["baseUrl"]!;
  static const String auth = "/auth";
  static const String categories = "/categories";
  static const String todo = "/todo";
}

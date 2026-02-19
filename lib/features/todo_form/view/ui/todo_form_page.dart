import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_app/features/todo_form/controllers/todo_form_controller.dart';

class TodoFormPage extends GetView<TodoFormController> {
  const TodoFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: _body(context),
      bottomNavigationBar: _bottomNav(context),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context) {
    return AppBar();
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 24.h, horizontal: 20.w),
    );
  }

  Widget _bottomNav(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 24.h, horizontal: 20.w),
    );
  }
}

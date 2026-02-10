import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/features/home/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _appbar(context),
      body: _body(context),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context) {
    return AppBar(
      title: Text(
        "Home",
        style: Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  Widget _body(BuildContext context) {
    return Center(
      child: Obx(() {
        final user = controller.userdata.value;
        if (user == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Text(
          "Hello ${user.name}",
          style: Theme.of(context).textTheme.displayLarge,
        );
      }),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return SizedBox();
  }
}

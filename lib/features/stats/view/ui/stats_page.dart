import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/features/stats/controllers/stats_controller.dart';
import 'package:task_management_app/shared/widgets/global_bottom_nav.dart';

class StatsPage extends GetView<StatsController> {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(title: const Text("Stats"));
  } 

  Widget _body() {
    return const Center(child: Text("Body"));
  }

  Widget _bottomNavigationBar() {
    return GlobalBottomNav(initialindex: 2);
  }
}
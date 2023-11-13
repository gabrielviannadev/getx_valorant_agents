import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_test/app/data/repository/agents_repository.dart';
import 'package:getx_test/app/pages/home/home_controller.dart';
import 'dart:developer';

homeDependecyInjection() {
  log('HOME INJECTED DEPENDENCY');
  Get.put<HomeController>(
    HomeController(
      repository: AgentsRepository(
        dio: Dio(),
      ),
    ),
  );
}

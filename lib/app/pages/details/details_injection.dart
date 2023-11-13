import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/data/repository/agents_repository.dart';
import 'package:getx_test/app/pages/details/details_controller.dart';
import 'dart:developer';

detailsDependencyInjection() {
  log('INJECTED DETAILS DEPENDENCY');
  Get.put<DetailsController>(
    DetailsController(
      repository: AgentsRepository(
        dio: Dio(),
      ),
    ),
  );
}

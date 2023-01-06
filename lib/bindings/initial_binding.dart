import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../repositories/tv_show_repository.dart';
import '../utils/contants.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => Dio(BaseOptions(baseUrl: apiUrl)),
      fenix: true,
    );
    Get.lazyPut(
      () => TvShowRepository(dio: Get.find()),
      fenix: true,
    );
  }
}

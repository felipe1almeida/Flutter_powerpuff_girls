import 'package:get/get.dart';

import '../controllers/tv_show_controller.dart';

class TvShowBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      TvShowController(
        tvShowRepository: Get.find(),
      ),
    );
  }
}

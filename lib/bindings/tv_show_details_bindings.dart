import 'package:get/get.dart';

import '../controllers/tv_show_details_controller.dart';

class TvShowDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvShowDetailsController>(
      () => TvShowDetailsController(),
    );
  }
}

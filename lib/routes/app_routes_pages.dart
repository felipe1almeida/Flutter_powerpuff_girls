import 'package:get/get.dart';

import '../bindings/tv_show_bindings.dart';
import '../bindings/tv_show_details_bindings.dart';
import '../pages/tv_show_details_page.dart';
import '../pages/tv_show_page.dart';

class AppRoutesPages {
  static final pages = [
    GetPage(
      name: '/',
      page: () => const TvShowPage(),
      binding: TvShowBindings(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: '/details',
      page: () => const TvShowDetailsPage(),
      binding: TvShowDetailsBindings(),
    ),
  ];
}

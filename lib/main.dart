import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/initial_binding.dart';
import 'routes/app_routes_pages.dart';
import 'utils/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Powerpuff girls',
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      getPages: AppRoutesPages.pages,
      theme: themeApp,
    );
  }
}

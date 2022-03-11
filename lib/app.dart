import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/core/bindings/initial_binding.dart';
import 'package:flutter_mvvm_getx/core/routes/app_pages.dart';
import 'package:flutter_mvvm_getx/core/services/localization_service.dart';
import 'package:flutter_mvvm_getx/utils/constants/main_theme.dart';
import 'package:flutter_mvvm_getx/utils/constants/main_values.dart';
import 'package:flutter_mvvm_getx/views/global_widgets/media_query_widget.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.theme,
      initialBinding: InitialBinding(),
      translations: LocalizationService(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      builder: (context, child) {
        return MediaQueryWidget(child: child);
      },
      getPages: AppPages.routes,
      title: MainValues.appName,
      color: MainThemes.colorLogo,
      initialRoute: AppPages.INITIAL,
    );
  }
}

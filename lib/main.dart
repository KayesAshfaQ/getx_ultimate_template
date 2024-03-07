import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/config/app_theme.dart';
import 'app/core/config/loader_style.dart';
import 'app/core/localization/localization_service.dart';
import 'app/core/utils/initial_binding.dart';
import 'app/routes/app_pages.dart';

void main() async {
  // make sure that all app widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // initialize get storage
  await GetStorage.init();

  // TODO: initialize firebase

  runApp(
    ScreenUtilInit(
      // todo add your (Xd / Figma) artboard size
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, widget) {
        return GetMaterialApp(
          title: "Shop Lover",
          debugShowCheckedModeBanner: false,
          initialBinding: InitialBinding(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: AppTheme.provideAppTheme(),
          locale: LocalizationService.getCurrentLocal(), // app language
          translations: LocalizationService
              .getInstance(), // localization services in app (controller app language)

          builder: (context, child) {
            getCustomLoaderInstance();

            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: FlutterEasyLoading(child: child!),
            );
          },
        );
      },
    ),
  );
}

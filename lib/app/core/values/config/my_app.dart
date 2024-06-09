import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../bindings/initial_binding.dart';
import 'app_config.dart';
import '../theme/app_theme.dart';
import '../../localization/localization_service.dart';
import '../../utils/analytics_helper.dart';
import '../theme/loader_style.dart';
import '../../../routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 866),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, widget) {
        return GetMaterialApp(
          title: AppConfig.appName,
          debugShowCheckedModeBanner: false,
          initialBinding: InitialBinding(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: AppTheme.provideAppTheme(),
          locale: LocalizationService.getCurrentLocal(), // app language
          translations: LocalizationService.getInstance(), // localization services in app (controller app language)
          navigatorObservers: [AnalyticsHelper.observer()], // sends navigation logs to analytics
          builder: (context, child) {
            // custom loader style
            getCustomLoaderInstance();

            // custom text scaler
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: FlutterEasyLoading(child: child!),
            );
          },
        );
      },
    );
  }
}

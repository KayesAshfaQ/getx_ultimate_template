import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../data/repository/remote/auth_repository.dart';
import '../../../data/repository/remote/auth_repository_impl.dart';
import '../../../data/repository/remote/search_repository.dart';
import '../../../data/repository/remote/search_repository_impl.dart';
import '../../../services/internet_connection/internet_connection_checker.dart';
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
          binds: [
            // Bind.put(() => InternetConnectionCheckService(), permanent: true),
            Bind.lazyPut(() => InternetConnectionCheckService(), fenix: true),
            Bind.lazyPut<AuthRepository>(() => AuthRepositoryImpl()),
            Bind.lazyPut<SearchRepository>(() => SearchRepositoryImpl()),
          ],
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

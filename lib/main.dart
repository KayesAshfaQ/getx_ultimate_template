import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/config/app_theme.dart';
import 'app/core/config/loader_style.dart';
import 'app/core/localization/localization_service.dart';
import 'app/core/utils/awesome_notifications_helper.dart';
import 'app/core/utils/firebase_helper.dart';
import 'app/core/utils/fcm_helper.dart';
import 'app/core/utils/initial_binding.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  // make sure that all app widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // initialize get storage
  await GetStorage.init();

  // initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // initialize fcm
  await FcmHelper.initFcm();

  // initialize awesome notifications
  await AwesomeNotificationsHelper.init();

  // initialize crashlytics
  FirebaseHelper.initCrashlytics();

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

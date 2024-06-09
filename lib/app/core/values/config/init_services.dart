import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app_config.dart';
import 'firebase_options.dart';
import '../../utils/analytics_helper.dart';
import '../../utils/awesome_notifications_helper.dart';
import '../../utils/crashlytics_helper.dart';
import '../../utils/fcm_helper.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '../../../../flavors/environment.dart';

instantiateServices({
  required Environment environment,
  required EnvConfig envConfig,
}) async {
  // set preferred orientations
  if (AppConfig.isOrientationPortraitOnly) {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  // initialize get storage
  await GetStorage.init();

  // initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // initialize fcm
  await FcmHelper.initFcm();

  // initialize awesome notifications
  await AwesomeNotificationsHelper.init();

  // initialize crashlytics
  await CrashlyticsHelper.initCrashlytics();

  // initialize analytics
  await AnalyticsHelper.initAnalytics();

  BuildConfig.instantiate(
    envType: environment,
    envConfig: envConfig,
  );
}
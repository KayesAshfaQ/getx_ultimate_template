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

// TODO: configure services here based on the environment 
instantiateServices() async {
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

  // log build config
  BuildConfig.instance.config.logger.i('BuildConfig: ${BuildConfig.instance.environment}');

}

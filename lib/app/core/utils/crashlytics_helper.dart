import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:sl_v4/app/core/utils/misc.dart';

class CrashlyticsHelper {
  // prevent making instance
  CrashlyticsHelper._();

  static void initCrashlytics() {
    try {
      final crashlytics = FirebaseCrashlytics.instance;

      crashlytics.setCrashlyticsCollectionEnabled(true);

      // Pass all uncaught errors from the framework to Crashlytics.
      FlutterError.onError = (errorDetails) {
        crashlytics.recordFlutterFatalError(errorDetails);
      };

      // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };

      // if you want to check if crashlytics is enabled or not
      if (crashlytics.isCrashlyticsCollectionEnabled) {
        printLog('Crashlytics is enabled');
      } else {
        printLog('Crashlytics is disabled');
      }
    } catch (error) {
      // if you are connected to firebase and still get error
      // check the todo up in the function else ignore the error
      // or stop fcm service from main.dart class
      printLog('Crashlytics is error', error: error);
    }
  }

  /// forcefully crashes the app for testing
  static void forceCrash() {
    FirebaseCrashlytics.instance.crash();
  }
}

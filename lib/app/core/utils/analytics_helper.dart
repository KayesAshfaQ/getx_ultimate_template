import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class AnalyticsHelper {
  // prevent making instance
  AnalyticsHelper._();

  /// initialize analytics
  static Future<void> initAnalytics() async {
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  }

  /// navigation observer
  static NavigatorObserver observer() {
    return FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);
  }

  /// log current screen
  static Future<void> setCurrentScreen(String screenName) async {
    await FirebaseAnalytics.instance.logScreenView(
      screenName: screenName,
    );
  }

  /// send event to analytics
  static Future<void> logEvent(
    String eventName, {
    Map<String, dynamic> parameters = const {},
  }) async {
    // send event to analytics
    await FirebaseAnalytics.instance.logEvent(
      name: eventName,
      parameters: parameters,
    );
  }
}

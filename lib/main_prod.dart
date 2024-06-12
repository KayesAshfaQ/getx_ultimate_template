import 'package:flutter/material.dart';

import 'app/core/values/config/my_app.dart';
import '/flavors/env_config.dart';
import 'flavors/build_config.dart';
import 'flavors/environment.dart';
import 'app/core/values/config/init_services.dart';
import 'app/core/values/const/api_end_points.dart';
import 'app/core/values/config/app_config.dart';

void main() async {
  // make sure that all app widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // instantiate environment configuration for production
  final prodConfig = EnvConfig(
    appName: '${AppConfig.appName.toUpperCase()} PROD',
    baseUrl: ApiEndPoints.baseUrlProd,
  );

  // instantiate the build configuration
  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: prodConfig,
  );

  // initialize all the required services
  await instantiateServices();

  runApp(const MyApp());
}

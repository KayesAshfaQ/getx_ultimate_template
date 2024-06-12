import 'package:flutter/material.dart';
import 'package:getx_ultimate_template/app/core/values/const/api_end_points.dart';
import 'package:getx_ultimate_template/app/core/values/config/app_config.dart';
import 'package:getx_ultimate_template/flavors/env_config.dart';

import 'app/core/values/config/my_app.dart';
import 'flavors/build_config.dart';
import 'flavors/environment.dart';
import 'app/core/values/config/init_services.dart';

void main() async {
  // make sure that all app widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // instantiate environment configuration for development
  final devConfig = EnvConfig(
    appName: '${AppConfig.appName.toUpperCase()} DEV',
    baseUrl: ApiEndPoints.baseUrlDev,
  );

  // instantiate the build configuration
  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  // initialize all the required services
  await instantiateServices();

  runApp(const MyApp());
}

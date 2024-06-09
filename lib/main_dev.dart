import 'package:flutter/material.dart';
import 'package:getx_ultimate_template/app/core/values/const/api_end_points.dart';
import 'package:getx_ultimate_template/app/core/values/config/app_config.dart';
import 'package:getx_ultimate_template/flavors/env_config.dart';

import 'app/core/values/config/my_app.dart';
import 'flavors/environment.dart';
import 'app/core/values/config/init_services.dart';

void main() async {
  // make sure that all app widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  final envConfig = EnvConfig(
    appName: '${AppConfig.appName.toUpperCase()} DEV',
    baseUrl: ApiEndPoints.baseUrlDev,
  );

  await instantiateServices(
    environment: Environment.DEVELOPMENT,
    envConfig: envConfig,
  );

  runApp(const MyApp());
}

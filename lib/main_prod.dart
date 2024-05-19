import 'package:flutter/material.dart';

import 'app/core/values/my_app.dart';
import '/flavors/env_config.dart';
import 'flavors/environment.dart';
import 'app/core/config/init_services.dart';
import 'app/core/values/api_end_points.dart';
import 'app/core/config/app_config.dart';

void main() async{
   // make sure that all app widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  final envConfig = EnvConfig(
    appName: '${AppConfig.appName.toUpperCase()} PROD',
    baseUrl: ApiEndPoints.baseUrlProd,
  );

  await instantiateServices(
    environment: Environment.DEVELOPMENT,
    envConfig: envConfig,
  );

  runApp(const MyApp());
}

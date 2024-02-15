import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../core/localization/localization_service.dart';
import '../../../core/localization/strings_enum.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //----------------Language Button----------------//
          InkWell(
            onTap: () => LocalizationService.updateLanguage(
              LocalizationService.getCurrentLocal().languageCode == 'ar' ? 'en' : 'ar',
            ),
            child: Ink(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.language,
                    size: 30,
                  ),
                  10.horizontalSpace,
                  Text(
                    LocalizationService.getCurrentLocal().languageCode == 'en' ? 'English' : 'العربية',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),

          10.verticalSpace,

          Text(
            '${Strings.goodMorning.tr} ,${Strings.hello.tr}',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

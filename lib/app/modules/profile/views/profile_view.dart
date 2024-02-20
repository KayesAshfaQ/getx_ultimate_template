import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sl_v4/app/core/base/base_view.dart';

import '../../../core/localization/localization_service.dart';
import '../../../core/localization/strings_enum.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends BaseView<ProfileController> {
  const ProfileView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text(Strings.profile.tr),
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //----------------Language Button----------------//
        InkWell(
          onTap: () => LocalizationService.updateLanguage(
            LocalizationService.getCurrentLocal().languageCode == 'en' ? 'bn' : 'en',
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
                  LocalizationService.getCurrentLocal().languageCode == 'en' ? 'English' : 'বাংলা',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

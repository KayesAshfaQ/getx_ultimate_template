import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/components/app_scaffold.dart';
import '../../../core/components/common_appbar.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      appBar: CommonAppBar(
        cartItemCount: 16,
        showBackButton: false,
      ),
      body: Center(
        child: Text('Profile is working'),
      ),
    );
  }
}

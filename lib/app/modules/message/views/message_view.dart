import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sl_v4/app/core/components/app_scaffold.dart';

import '../../../core/localization/strings_enum.dart';
import '../controllers/message_controller.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(Strings.messages.tr),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MessageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

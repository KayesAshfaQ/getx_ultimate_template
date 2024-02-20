import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sl_v4/app/core/base/base_view.dart';

import '../../../core/localization/strings_enum.dart';
import '../controllers/message_controller.dart';

class MessageView extends BaseView<MessageController> {
  const MessageView({super.key});

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text(
        'MessageView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text(Strings.messages.tr),
      centerTitle: true,
    );
  }
}

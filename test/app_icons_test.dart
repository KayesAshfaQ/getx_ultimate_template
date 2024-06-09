import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:getx_ultimate_template/app/core/values/resources/resources.dart';

void main() {
  test('app_icons assets test', () {
    expect(File(AppIcons.back).existsSync(), isTrue);
    expect(File(AppIcons.cart).existsSync(), isTrue);
    expect(File(AppIcons.changeLanguage).existsSync(), isTrue);
    expect(File(AppIcons.changePassword).existsSync(), isTrue);
    expect(File(AppIcons.chat).existsSync(), isTrue);
    expect(File(AppIcons.heart).existsSync(), isTrue);
    expect(File(AppIcons.home).existsSync(), isTrue);
    expect(File(AppIcons.location).existsSync(), isTrue);
    expect(File(AppIcons.logout).existsSync(), isTrue);
    expect(File(AppIcons.manageShippingAddress).existsSync(), isTrue);
    expect(File(AppIcons.myWishList).existsSync(), isTrue);
    expect(File(AppIcons.notificationOutline).existsSync(), isTrue);
    expect(File(AppIcons.notifications).existsSync(), isTrue);
    expect(File(AppIcons.paymentMethod).existsSync(), isTrue);
    expect(File(AppIcons.purchaseHistory).existsSync(), isTrue);
    expect(File(AppIcons.refundRequests).existsSync(), isTrue);
    expect(File(AppIcons.search).existsSync(), isTrue);
    expect(File(AppIcons.settingsOutline).existsSync(), isTrue);
    expect(File(AppIcons.star).existsSync(), isTrue);
    expect(File(AppIcons.supportTicket).existsSync(), isTrue);
    expect(File(AppIcons.termsConditions).existsSync(), isTrue);
    expect(File(AppIcons.trackOrdersIcon).existsSync(), isTrue);
    expect(File(AppIcons.user).existsSync(), isTrue);
  });
}

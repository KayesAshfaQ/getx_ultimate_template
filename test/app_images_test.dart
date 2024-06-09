import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:getx_ultimate_template/app/core/values/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.homeHeaderBg).existsSync(), isTrue);
    expect(File(AppImages.noImageFound).existsSync(), isTrue);
    expect(File(AppImages.noInternet).existsSync(), isTrue);
    expect(File(AppImages.noPp).existsSync(), isTrue);
    expect(File(AppImages.placeholderDeals).existsSync(), isTrue);
    expect(File(AppImages.promotionalDemo).existsSync(), isTrue);
  });
}

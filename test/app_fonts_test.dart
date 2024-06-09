import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:getx_ultimate_template/app/core/values/resources/resources.dart';

void main() {
  test('app_fonts assets test', () {
    expect(File(AppFonts.interBlack).existsSync(), isTrue);
    expect(File(AppFonts.interBold).existsSync(), isTrue);
    expect(File(AppFonts.interExtraBold).existsSync(), isTrue);
    expect(File(AppFonts.interExtraLight).existsSync(), isTrue);
    expect(File(AppFonts.interLight).existsSync(), isTrue);
    expect(File(AppFonts.interMedium).existsSync(), isTrue);
    expect(File(AppFonts.interRegular).existsSync(), isTrue);
    expect(File(AppFonts.interSemiBold).existsSync(), isTrue);
    expect(File(AppFonts.interThin).existsSync(), isTrue);
    expect(File(AppFonts.kalpurush).existsSync(), isTrue);
  });
}

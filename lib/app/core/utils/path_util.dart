import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'misc.dart';

class PathUtil {
  PathUtil._();

  static Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
        // ignore: avoid_slow_async_io
        if (!await directory.exists()) directory = await getExternalStorageDirectory();
      }
    } catch (err, stack) {
      printLog("Cannot get download folder path", error: err, stackTrace: stack);
    }
    return directory?.path;
  }
}

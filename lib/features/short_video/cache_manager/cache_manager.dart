import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AppCacheManager {
  static Future<File> getFile(List<String> urlList, int index) async {
    final manager = DefaultCacheManager();

    File file = await manager.getSingleFile(urlList[index]);

    if (index + 1 < urlList.length) {
      manager.getSingleFile(urlList[index + 1]);
    }
    if (index + 2 < urlList.length) {
      manager.getSingleFile(urlList[index + 2]);
    }

    int deleteIndex = index - 10;

    if (deleteIndex >= 0 && deleteIndex < urlList.length) {
      manager.removeFile(urlList[deleteIndex]);
    }

    return file;
  }
}

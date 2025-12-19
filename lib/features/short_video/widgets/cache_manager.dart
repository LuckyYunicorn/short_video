import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
class VideoCacheManager{
  static Future<File> getVideo({required String url})async{
    File file = await DefaultCacheManager().getSingleFile(url);
    print("************************************************** $file");
    return file;
  }
}
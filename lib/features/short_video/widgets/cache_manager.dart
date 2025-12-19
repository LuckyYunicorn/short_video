import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class VideoCacheManager {
  VideoCacheManager._internal();
  static final VideoCacheManager _instance = VideoCacheManager._internal();
  factory VideoCacheManager() => _instance;

  final DefaultCacheManager _cacheManager = DefaultCacheManager();

  /// Get or download video
  Future<File> getVideo({required String url}) async {
    return await _cacheManager.getSingleFile(url);
  }

  /// ✅ Correct way to remove cache
  Future<void> clearCache({required String url}) async {
    await _cacheManager.removeFile(url);

    final stillCached = await _cacheManager.getFileFromCache(url);
    print("Cache cleared: ${stillCached == null}");
  }

  /// Clear all cache
  Future<void> clearAll() async {
    await _cacheManager.emptyCache();
  }
}

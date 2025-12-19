import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:short_video/data/short_video_dummy_data.dart';
import 'package:short_video/features/short_video/bloc/short_video_event.dart';
import 'package:short_video/features/short_video/bloc/short_video_state.dart';
import 'package:short_video/features/short_video/widgets/cache_manager.dart';

class ShortVideoBloc extends Bloc<ShortVideoEvent, ShortVideoState> {
  ShortVideoBloc() : super(ShortVideoState()) {
    on<GetShortVideo>(_getShortVideo);
  }

  Future<void> _getShortVideo(
    GetShortVideo event,
    Emitter<ShortVideoState> emit,
  ) async {
    VideoCacheManager videoCacheManager = VideoCacheManager();
    emit(state.copyWith(isLoading: true));
    List<String> videos = [];

    for (int i = 0; i < DummyData.videos.length; i++) {
      File video = await videoCacheManager.getVideo(url: DummyData.videos[i]);
      videos.add(video.path);
    }
    emit(
      state.copyWith(
        isLoading: false,
        videoUrl: videos,
      ),
    );
  }
}

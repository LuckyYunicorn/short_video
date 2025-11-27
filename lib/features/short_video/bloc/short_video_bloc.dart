import 'package:short_video/features/short_video/bloc/short_video_event.dart';
import 'package:short_video/features/short_video/bloc/short_video_state.dart';
import 'package:bloc/bloc.dart';

class ShortVideoBloc extends Bloc<ShortVideoEvent, ShortVideoState> {
  ShortVideoBloc() : super(ShortVideoInitial()) {
    on<GetShortVideos>(_getShortVideos);
  }
  Future<void> _getShortVideos(
    GetShortVideos event,
    Emitter<ShortVideoState> emit,
  ) async {
    try {
      Future.delayed(Duration(seconds: 2));
      List<String> videoList = [
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        'https://www.pexels.com/download/video/7564024/',
        'https://www.pexels.com/download/video/9032179/',
        'https://www.pexels.com/download/video/8925055/',
      ];
      if (videoList.isNotEmpty) {
        emit(ShortVideoLoaded(shortVideoList: videoList));
      } else {
        emit(ShortVideoError(message: "Unable to load video"));
      }
    } catch (e) {
      emit(ShortVideoError(message: e.toString()));
    }
  }
}

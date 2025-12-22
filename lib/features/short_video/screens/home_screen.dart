import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:short_video/features/short_video/bloc/short_video_bloc.dart';
import 'package:short_video/features/short_video/bloc/short_video_event.dart';
import 'package:short_video/features/short_video/widgets/cache_manager.dart';
import '../bloc/short_video_state.dart';
import 'short_video_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VideoCacheManager videoCacheManager = VideoCacheManager();
    return BlocProvider(
      create: (context) => ShortVideoBloc()..add(GetShortVideo()),
      child: Scaffold(
        body: BlocBuilder<ShortVideoBloc, ShortVideoState>(
          builder: (context, state) {
            if (state.isLoading && state.videoUrl.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return PageView.builder(
              onPageChanged: (value) async {
                await videoCacheManager.clearCache(
                  url: state.videoUrl[value - 1],
                );
              },
              scrollDirection: Axis.vertical,
              itemCount: state.videoUrl.length,
              itemBuilder: (context, index) {
                return SafeArea(
                  child: ShortVideoScreen(videoUrl: state.videoUrl[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

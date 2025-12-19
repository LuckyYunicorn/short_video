import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:short_video/data/short_video_dummy_data.dart';
import 'package:short_video/features/short_video/bloc/short_video_bloc.dart';
import 'package:short_video/features/short_video/bloc/short_video_event.dart';
import 'package:short_video/features/short_video/widgets/cache_manager.dart';

import '../bloc/short_video_state.dart';
import 'short_video_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future<File> getVideo() async {
  return await VideoCacheManager.getVideo(url: DummyData.videos[0]);
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ShortVideoBloc()
        ..add(GetShortVideo()),
      child: Scaffold(
        body: BlocBuilder<ShortVideoBloc, ShortVideoState>(
          builder: (context, state) {
            return PageView.builder(
              onPageChanged: (value) {

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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:short_video/features/short_video/bloc/short_video_bloc.dart';
import 'package:short_video/features/short_video/bloc/short_video_event.dart';
import 'package:short_video/features/short_video/bloc/short_video_state.dart';
import 'package:short_video/features/short_video/cache_manager/cache_manager.dart';

import '../widgets/video_structure.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    File? file;
    return BlocProvider(
      create: (context) => ShortVideoBloc()..add(GetShortVideos()),
      child: Scaffold(
        body: BlocBuilder<ShortVideoBloc, ShortVideoState>(
          builder: (context, state) {
            if (state is ShortVideoInitial) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ShortVideoError) {
              return Center(child: Text(state.message));
            }
            if (state is ShortVideoLoaded) {
              AppCacheManager.getFile(state.shortVideoList, 0);
              return PageView.builder(
                onPageChanged: (index) async{
                file = await AppCacheManager.getFile(state.shortVideoList, index);
                },
                scrollDirection: Axis.vertical,
                itemCount: state.shortVideoList.length,
                itemBuilder: (context, index) {
                  AppCacheManager.getFile(state.shortVideoList, index);
                  return VideoStructure(file: file ?? File("path"));
                },
              );
            }
            return Center(child: SizedBox());
          },
        ),
      ),
    );
  }
}

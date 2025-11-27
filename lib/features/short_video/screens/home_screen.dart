import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocBuilder;
import 'package:short_video/features/short_video/bloc/short_video_bloc.dart';
import 'package:short_video/features/short_video/bloc/short_video_event.dart';
import 'package:short_video/features/short_video/bloc/short_video_state.dart';

import '../widgets/video_structure.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ShortVideoBloc()
        ..add(GetShortVideos()),
      child: Scaffold(
        body: BlocBuilder<ShortVideoBloc, ShortVideoState>(
          builder: (context, state) {

            if(state is ShortVideoInitial){
              return Center(
                child: CircularProgressIndicator(),
              );
            } if(state is ShortVideoError){
              return Center(
                child: Text(state.message),
              );
            }
            if(state is ShortVideoLoaded){
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.shortVideoList.length,
                itemBuilder: (context, index) {
                  return VideoStructure(
                    url: state.shortVideoList[index],
                  );
                },
              );
            }
            return Center(
              child: SizedBox(),
            );
          },
        ),
      ),
    );
  }
}

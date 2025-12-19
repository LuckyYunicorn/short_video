import 'package:flutter/material.dart';
import 'package:short_video/features/short_video/widgets/short_video_player.dart';
import 'package:short_video/features/short_video/widgets/shorts_description.dart';

import '../widgets/shorts_icons.dart';

class ShortVideoScreen extends StatelessWidget {
  final String videoUrl;
  const ShortVideoScreen({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ShortVideoPlayer(videoUrl: videoUrl)
          ),
          Positioned(
            right: 10,
            bottom: 30,
            child: ShortsIcons(),
          ),
          Positioned(
            bottom: 30,
            left: 10,
            right: 80,
            child: ShortsDescription(),
          ),

        ],
      ),
    );
  }
}

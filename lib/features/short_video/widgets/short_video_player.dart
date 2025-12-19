import 'dart:io';

import 'package:flutter/material.dart';
import 'package:short_video/features/short_video/widgets/cache_manager.dart';
import 'package:video_player/video_player.dart';

class ShortVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const ShortVideoPlayer({super.key, required this.videoUrl});

  @override
  State<ShortVideoPlayer> createState() => _ShortVideoPlayerState();
}

class _ShortVideoPlayerState extends State<ShortVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized
        ? SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: VideoPlayer(_controller),
          )
        : const Center(child: CircularProgressIndicator());
  }
}

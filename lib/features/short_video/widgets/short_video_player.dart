import 'dart:io';

import 'package:flutter/material.dart';
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
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.file(File(widget.videoUrl))
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
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized
        ? InkWell(
            onTap: () {
              isPlaying ? _controller.pause() : _controller.play();
              setState(() {
                isPlaying = !isPlaying;
              });
            },
            child: isPlaying
                ? SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: VideoPlayer(_controller),
                  )
                : SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        VideoPlayer(_controller),
                        Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}

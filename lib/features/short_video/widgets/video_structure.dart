import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'icons_column.dart';

class VideoStructure extends StatefulWidget {
  final String url;
  const VideoStructure({super.key, required this.url});

  @override
  State<VideoStructure> createState() => _VideoStructureState();
}

class _VideoStructureState extends State<VideoStructure> {
  int maxLine = 2;

  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);

        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height,
      width: width,
      // color: Colors.blue,
      child: Stack(
        children: [
          _controller.value.isInitialized
              ? Align(
                  alignment: Alignment.center,
                  child: VideoPlayer(_controller),
                )
              : Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
          Positioned(top: height * 0.55, right: 10, child: IconsColumn()),
          Positioned(
            bottom: height * 0.1,
            left: 10,
            child: Row(
              spacing: 10,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.person_outline, size: 40),
                ),
                SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Name",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          maxLine == 2 ? maxLine = 20 : maxLine = 2;
                          setState(() {});
                        },

                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do Lorem ipsum dolor sit amet consectetur adipiscing elit sed do.",
                          maxLines: maxLine,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

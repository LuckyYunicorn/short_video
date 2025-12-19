import 'package:flutter/material.dart';

class ShortsIcons extends StatelessWidget {
  const ShortsIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 15,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_outline, size: 35),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.comment_outlined, size: 35),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.group_outlined, size: 35),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share_outlined, size: 35),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.music_video_outlined, size: 35),
        ),
      ],
    );
  }
}

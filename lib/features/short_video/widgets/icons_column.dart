import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconsColumn extends StatelessWidget {
  const IconsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.thumb_up_outlined, size: 30),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.comment_outlined, size: 30),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share_outlined, size: 30),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.check_circle_outline, size: 30),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz, size: 30),
        ),IconButton(
          onPressed: () {},
          icon: Icon(Icons.person_outline, size: 30),
        ),
      ],
    );
  }
}

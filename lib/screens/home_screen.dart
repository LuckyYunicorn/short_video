import 'package:flutter/material.dart';
import 'package:short_video/screens/widgets/video_structure.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return VideoStructure();
        },
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'features/short_video/screens/home_screen.dart';

void main() {
  runApp(const ShortVideo());
}

class ShortVideo extends StatelessWidget {
  const ShortVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Short Video",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';

class ShortsDescription extends StatelessWidget {
  const ShortsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 30),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("username", style: TextStyle(fontSize: 18)),
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                "descripton descripton descriptondescriptondescriptondescriptondescriptondescriptondescripton",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

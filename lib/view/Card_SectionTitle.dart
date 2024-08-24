import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("#",
            style: TextStyle(
                color: Colors.deepOrangeAccent, fontSize: 4.screenWidth)),
        SizedBox(width: 16.5.screenWidth),
        Text("REPS",
            style: TextStyle(
                color: Colors.deepOrangeAccent, fontSize: 3.screenWidth)),
        SizedBox(width: 19.screenWidth),
        Text("KGS",
            style: TextStyle(
                color: Colors.deepOrangeAccent, fontSize: 3.screenWidth)),
      ],
    );
  }
}

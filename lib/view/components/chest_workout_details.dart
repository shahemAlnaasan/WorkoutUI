import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ChestWorkoutDetails extends StatelessWidget {
  const ChestWorkoutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Chest Workout",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 0.5.screenHeight),
        Text(
          "Pro Tip:",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          "Focus on sitting \"back\" and down, Keep toour knees \"pushed\"",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          "outwards",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: 3.screenHeight),
      ],
    );
  }
}

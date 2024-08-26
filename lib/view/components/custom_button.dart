import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomButton extends StatelessWidget {
  String title;
  CustomButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.screenWidth,
      height: 10.screenHeight,
      color: const Color(0xff151515),
      child: Center(
        child: Container(
          width: 80.screenWidth,
          height: 7.screenHeight,
          decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(18)),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

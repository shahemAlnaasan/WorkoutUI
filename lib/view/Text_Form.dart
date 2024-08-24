import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class textForm extends StatelessWidget {
  const textForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12.6.screenWidth,
      height: 2.5.screenHeight,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 3.screenWidth),
        cursorColor: Colors.white,
        cursorHeight: 2.screenHeight,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomcheckBox extends StatelessWidget {
  bool value;
  void Function(bool?)? onChanged;

  CustomcheckBox({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.2,
      child: Checkbox(
          side: MaterialStateBorderSide.resolveWith((state) =>
              const BorderSide(color: Colors.deepOrangeAccent, width: 1)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          activeColor: Colors.transparent,
          checkColor: Colors.deepOrangeAccent,
          value: value,
          onChanged: onChanged),
    );
  }
}

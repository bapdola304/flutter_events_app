import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final double? height;

  const InputField({Key? key, this.hintText, this.controller, this.height = 55})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: height,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xFFE8E8E8)),
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFFBDBDBD)),
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}

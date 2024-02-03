import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.maximumLines,
    this.suffixIcon,
  });
  final TextEditingController? controller;
  final String hintText;
  final int? maximumLines;
  final IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      maxLines: maximumLines ?? 1,
      onChanged: (value) {},
      controller: controller,
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.purple,
      minLines: 6,
      maxLines: null,
      decoration: InputDecoration(
        border: buildBorder(Colors.grey.shade300),
        enabledBorder: buildBorder(Colors.grey.shade300),
        focusedBorder: buildBorder(Colors.purple),
        hintText: 'Enter text',
        hintStyle: TextStyle(color: Colors.grey.shade500),
      ),
    );
  }

  OutlineInputBorder buildBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: BorderSide(color: borderColor),
    );
  }
}

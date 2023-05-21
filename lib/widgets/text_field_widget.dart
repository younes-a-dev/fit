import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key, required this.controller, required this.title,this
          .focusNode,this.helperText})
      : super(key: key);

  final TextEditingController controller;
  final String title;
  final FocusNode? focusNode;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      cursorColor: Colors.black,
      style: const TextStyle(
        color: Colors.black54,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xfff5f5f5),
        suffixText: helperText,
        suffixStyle: const TextStyle(color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: title,
        hintStyle: const TextStyle(
          color: Colors.black38,
        ),
      ),
    );
  }
}

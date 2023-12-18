import 'package:flutter/material.dart';

class CustomField extends StatelessWidget{
  final controller;
  final String hintText;
  final bool obsecure;

  const CustomField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsecure,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecure,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade700,)
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFFFFFF))
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade700,)
      ),
      style: const TextStyle(color: Color(0xFFFFFFFF)),
    );
  }
}
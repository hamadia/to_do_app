import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);
typedef OnChange = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.validator,
    this.controller,
    this.onChange,
    this.obscureText = false,
    this.suffixIcon,
    this.maxLines = 1,
      this.initialValue});

  final String labelText;
  final Validator? validator;
  final OnChange? onChange;
  final TextEditingController? controller;
  final bool obscureText;
  final int maxLines;
  final Widget? suffixIcon;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        initialValue: initialValue,
        maxLines: maxLines,
        minLines: maxLines,
        onChanged: onChange,
        obscureText: obscureText,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          labelText: labelText,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

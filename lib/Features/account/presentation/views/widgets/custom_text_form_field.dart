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
  });

  final String labelText;
  final Validator? validator;
  final OnChange? onChange;
  final TextEditingController? controller;
  final bool obscureText;

  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
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

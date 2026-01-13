import 'package:flutter/material.dart';
import '../../../../core/constants/const_size.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
  });

  InputDecoration _decoration(BuildContext context) => InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: Colors.white70),
    filled: true,
    fillColor: Colors.white.withValues(alpha: 0.1),
    contentPadding:
    const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ConstSize.formCardRadius),
      borderSide: const BorderSide(color: Colors.white54, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ConstSize.formCardRadius),
      borderSide: const BorderSide(color: Colors.white, width: 1.2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ConstSize.formCardRadius),
      borderSide: BorderSide(color: Colors.redAccent.shade200, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ConstSize.formCardRadius),
      borderSide: BorderSide(color: Colors.redAccent.shade100, width: 1.2),
    ),
    errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      decoration: _decoration(context),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  /// The controller for the text field.
  final TextEditingController controller;

  /// The label or hint text to display inside the text field.
  final String hintText;

  /// Whether the text should be obscured (e.g., for passwords).
  final bool obscureText;

  /// The icon displayed at the end of the text field.
  final IconData? suffixIcon;

  /// Callback function when the text changes.
  final void Function(String)? onChanged;

  /// Callback function when the user submits the text.
  final void Function(String)? onSubmitted;

  /// Constructor for the CustomTextField.
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon)
            : null, // Add a suffix icon if provided
      ),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}

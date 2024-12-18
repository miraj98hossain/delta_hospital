import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CommonTextFieldWidget extends StatelessWidget {
  const CommonTextFieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.focusNode,
    this.onChanged,
  });
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autofocus: false,
      autocorrect: false,
      enableSuggestions: false,
      style: lightTextTheme.bodySmall!.copyWith(
        fontSize: 12,
        color: Colors.grey,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: appTheme.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Circular border
          borderSide: BorderSide(
            color: appTheme.primary,
          ),
          // No border side
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Circular border
          borderSide: BorderSide(
            color: appTheme.primary,
          ),
          // No border side
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Circular border
          borderSide: BorderSide(
            color: appTheme.primary,
          ),
          // No border side
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Circular border
          borderSide: BorderSide(
            color: appTheme.primary,
          ),
          // No border side
        ),
        hintText: hintText,
        hintStyle: lightTextTheme.bodySmall!.copyWith(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    );
  }
}

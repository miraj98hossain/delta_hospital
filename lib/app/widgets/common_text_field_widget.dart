import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextFieldWidget extends StatelessWidget {
  const CommonTextFieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.inputFormatters,
    this.readOnly = false,
    this.suffix,
    this.obscureText = false,
    this.onTap,
  });
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final bool readOnly;
  final Widget? suffix;
  final bool obscureText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      focusNode: focusNode,
      autofocus: false,
      autocorrect: false,
      enableSuggestions: false,
      style: lightTextTheme.bodySmall!.copyWith(
        fontSize: 12,
        color: Colors.grey,
      ),
      onTap: onTap,
      onTapOutside: (event) {
        focusNode?.unfocus();
      },
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: appTheme.white,
        filled: true,
        isDense: true,
        suffixIcon: suffix,
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
      validator: validator,
    );
  }
}

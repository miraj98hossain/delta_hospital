import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CommonDropdownButton<T> extends StatelessWidget {
  const CommonDropdownButton({
    super.key,
    required this.hintText,
    this.items,
    this.value,
    required this.onChanged,
    this.validator,
  });
  final String hintText;
  final List<T>? items;
  final T? value;
  final void Function(T? value) onChanged;
  final String? Function(T? value)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: DropdownButtonFormField<T>(
        value: value,
        isExpanded: true,
        padding: EdgeInsets.zero,
        menuMaxHeight: 250,
        decoration: const InputDecoration()
            .applyDefaults(Theme.of(context).inputDecorationTheme)
            .copyWith(
              contentPadding: const EdgeInsets.all(5),
            ),
        hint: Text(
          hintText,
          style: lightTextTheme.bodySmall!.copyWith(
            color: appTheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: lightTextTheme.bodyMedium!.copyWith(
          overflow: TextOverflow.ellipsis,
          color: appTheme.primary,
          fontWeight: FontWeight.bold,
        ),
        items: items?.map(
          (e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e.toString()),
            );
          },
        ).toList(),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscure;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final IconData? iconData;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChange,
      this.validator,
      this.iconData,
      this.obscure = false});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: colors.primary));

    return TextFormField(
      onChanged: onChange,
      validator: validator,
      obscureText: obscure,
      decoration: InputDecoration(
        border: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder: border,
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        prefixIcon: Icon(iconData, color: colors.primary),
      ),
    );
  }
}

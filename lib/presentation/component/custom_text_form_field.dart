import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData? prefixIconData;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String? value)? validate;
  final bool isPassword;

  const CustomTextFormField({
    Key? key,
    this.prefixIconData,
    this.hintText,
    this.controller,
    this.validate,
    bool? isPassword,
  })  : isPassword = isPassword ?? false,
        super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final suffixIcon = widget.isPassword
        ? IconButton(
        onPressed: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
        icon: Icon(
          showPassword ? Icons.visibility_off : Icons.visibility,
        ))
        : null;

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon:
        widget.prefixIconData != null ? Icon(widget.prefixIconData!) : null,
        hintText: widget.hintText,
        suffixIcon: suffixIcon,
      ),
      validator: widget.validate,
      obscureText: widget.isPassword && !showPassword,
    );
  }
}
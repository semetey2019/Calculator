import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.inputType,
    required this.hintText,
    this.controller,
    required this.obscureText1,
    this.maxLength,
    this.icon,
    this.onTap,
    this.validator,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final int? maxLength;
  final bool obscureText1;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType? inputType;
  final Widget? icon;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.10,
            fontSize: 17,
          ),
      keyboardType: inputType,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.blue)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: hintText,
        suffixIcon:
            icon != null ? IconButton(icon: icon!, onPressed: onTap) : null,
      ),
      obscureText: obscureText1,
    );
  }
}

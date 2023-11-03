import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    super.key,
    required this.hintext,
    required this.prefixIcon,
    this.image,
  });

  final String hintext;
  final Icon prefixIcon;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.10,
            fontSize: 17,
          ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Заполните поле';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.blue)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: hintext,
        prefixIcon: prefixIcon,
      ),
    );
  }
}

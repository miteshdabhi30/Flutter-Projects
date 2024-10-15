import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final IconButton? suffixIcon;
  final bool obscure;
  final FormFieldValidator? validator;
  final double heightPadding;
  final double widthPadding;
  final FocusNode? focusNode;
  final ValueChanged? onSubmitted;
  final int? minLine;
  final int maxLine;
  final ValueChanged? onChanged;


  const CustomTextFormField(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller,
      this.keyboardType,
      this.suffixIcon,
      this.obscure = false,
      this.validator,
      this.heightPadding = 0,
      this.widthPadding = 0,
        this.focusNode,
        this.onSubmitted,
        this.minLine,
        this.maxLine = 1,
        this.onChanged
       });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure,
      validator: validator,
      focusNode: focusNode,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      minLines: minLine,
      maxLines: maxLine,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: label,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(vertical: heightPadding, horizontal: widthPadding),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey)
          ),
          fillColor: Colors.grey.shade300,
          filled: true),
    );
  }
}

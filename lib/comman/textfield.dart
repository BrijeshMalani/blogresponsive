import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  TextEditingController? controller;
  String? hint;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  dynamic maxLength;
  dynamic textInputAction;
  String? label;
  Color? cursorColor;
  final bool obSecure;

  CommonTextField(
      {this.controller,
      this.hint,
      this.suffixIcon,
      this.keyboardType,
      this.maxLength,
      required this.obSecure,
      this.label,
      this.cursorColor = Colors.black,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: cursorColor,
      textInputAction: textInputAction,
      validator: (value) {
        if (value!.isEmpty) {
          return '* required';
        } else {
          return null;
        }
      },
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      obscureText: obSecure,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        counterText: "",
        hintText: hint,
        labelText: label,
        fillColor: Colors.transparent,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}

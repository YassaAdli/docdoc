import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.validator,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.controller,
  });
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      // onSaved:onSaved ,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onTapUpOutside: (event) => FocusScope.of(context).unfocus(),
      cursorColor: ColorManager.textColor,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: ColorManager.textColor),

        border: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: ColorManager.textColor),
    );
  }
}

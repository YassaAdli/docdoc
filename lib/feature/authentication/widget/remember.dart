import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:flutter/material.dart';

class Remember extends StatefulWidget {
  final ValueChanged<bool?> onChanged;
  final bool value;
  const Remember({super.key, required this.onChanged, required this.value});

  @override
  State<Remember> createState() => _RememberState();
}

class _RememberState extends State<Remember> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.value ,
          onChanged: widget.onChanged,
          checkColor: Colors.white,
          activeColor: ColorManager.primaryColor,
        ),
        const Text(
          'Remember me',
          style: TextStyle(
            color: ColorManager.textColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        const Text(
          'Forgot Password?',
          style: TextStyle(
            color: ColorManager.primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/validator.dart';
import 'package:flutter/material.dart';

class CustomGenderDropdown extends StatelessWidget {
  const CustomGenderDropdown({super.key, this.gender, required this.onChanged});
  final String? gender;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: Validators.validateGender,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: ColorManager.textColor),
        hintText: 'Gender',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorManager.textColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorManager.textColor, width: 2),
        ),
      ),
      dropdownColor: Colors.white,
      style: const TextStyle(color: Colors.black, fontSize: 14),
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: ColorManager.textColor,
      ),
      items: const ['Male', 'Female']
          .map(
            (gender) => DropdownMenuItem(
              value: gender,
              child: Text(
                gender,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          )
          .toList(),
      onChanged: (value) {
        if (value == "Male") {
          onChanged('0');
        } else if (value == "Female") {
          onChanged('1');
        }
      },
      value: gender == '0'
          ? "Male"
          : gender == '1'
          ? "Female"
          : null,
    );
  }
}

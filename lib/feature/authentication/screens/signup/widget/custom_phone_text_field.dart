import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:Docdoc/core/utils/validator.dart';
import 'package:flutter/material.dart';

class CustomPhoneTextField extends StatelessWidget {
  const CustomPhoneTextField({super.key, required this.phoneController});
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneController,

      validator: Validators.validatePhone,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: "phone",
        filled: true,
        hintStyle: const TextStyle(color: ColorManager.textColor),
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorManager.textColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorManager.textColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorManager.textColor),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: Colors.white,
                  value: "Egypt",
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorManager.textColor,
                    size: 20,
                  ),
                  items: [
                    DropdownMenuItem(
                      value: "Egypt",
                      child: Image.asset(
                        TImage.egyptFlag,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    // handle change
                  },
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 1,
                height: 24,
                color: ColorManager.textColor, // لون الـ divider
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      ),
    );
  }
}

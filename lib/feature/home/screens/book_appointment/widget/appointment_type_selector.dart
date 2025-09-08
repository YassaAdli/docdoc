import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppointmentTypeSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const AppointmentTypeSelector({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> appointmentTypes = [
      {
        "icon": TImage.profile,
        "label": "In Person",
        "color": ColorManager.surfaceBlue,
      },
      {
        "icon": TImage.video,
        "label": "Video Call",
        "color": ColorManager.surfaceGreen,
      },
      {
        "icon": TImage.call,
        "label": "Phone Call",
        "color": ColorManager.surfaceRed,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Appointment Type',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorManager.text100,
          ),
        ),
        const SizedBox(height: 24),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: appointmentTypes.length,
          separatorBuilder: (_, __) =>
              const Divider(color: ColorManager.text20, height: 16),
          itemBuilder: (context, index) {
            final type = appointmentTypes[index];
            return GestureDetector(
              onTap: () => onChanged(index),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: type["color"],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(child: SvgPicture.asset(type["icon"])),
                  ),
                  const SizedBox(width: 16),
                  Expanded(child: Text(type["label"])),
                  Radio<int>(
                    value: index,
                    groupValue: selectedIndex,
                    activeColor: ColorManager.primaryColor,
                    onChanged: (value) => onChanged(value!),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

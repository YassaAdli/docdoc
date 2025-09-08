import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:flutter/material.dart';
class CustomToggleButton extends StatelessWidget {
  final VoidCallback onTapAppointment;
  const CustomToggleButton({super.key, required this.onTapAppointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTapAppointment,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.surface,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                height: 59,
                child: const Center(
                  child: Text(
                    'My Appointment',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
            child: VerticalDivider(
              color: ColorManager.text20,
              thickness: 1,
              endIndent: 5,
              indent: 5,
              width: 20,),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: ColorManager.surface,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              height: 59,
              child: const Center(
                child: Text(
                  'Medical records',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

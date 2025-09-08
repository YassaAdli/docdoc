import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AvailableTime extends StatelessWidget {
  final String? selectedTime;
  final ValueChanged<String> onChanged;

  const AvailableTime({
    super.key,
    required this.selectedTime,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final times = _generateTimes();

    return SizedBox(
      height: 180,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3.2,
        ),
        itemCount: times.length,
        itemBuilder: (context, index) {
          final time = times[index];
          final isSelected = selectedTime == time;
          return GestureDetector(
            onTap: () => onChanged(time),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: isSelected
                    ? ColorManager.primaryColor
                    : ColorManager.surfaceText,
              ),
              child: Center(
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected
                        ? ColorManager.onPrimary
                        : ColorManager.text50,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<String> _generateTimes() {
    final List<String> times = [];
    DateTime startTime = DateTime(2023, 1, 1, 9, 0); // start from 09:00 AM
    for (int i = 0; i < 6; i++) {
      times.add(DateFormat('hh:mm a').format(startTime));
      startTime = startTime.add(const Duration(minutes: 30));
    }
    return times;
  }

  String formatAppointmentDate(DateTime date) {
    final datePart = DateFormat(
      'EEEE, dd MMMM yyyy',
    ).format(date); // Wednesday, 08 May 2023
    final timePart = DateFormat('hh:mm a').format(date); // 08:30 AM
    return "$datePart\n$timePart";
  }
}

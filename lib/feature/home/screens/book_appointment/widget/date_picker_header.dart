import 'package:Docdoc/feature/home/screens/homescreen/widget/home_header.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerHeader extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onChanged;

  const DatePickerHeader({
    super.key,
    required this.selectedDate,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final int totalDays = 30;
    final List<DateTime> allDates = List.generate(
      totalDays,
      (i) => DateTime.now().add(Duration(days: i)),
    );

    int selectedIndex = allDates.indexWhere(
      (date) => DateUtils.isSameDay(date, selectedDate),
    );

    int startIndex = (selectedIndex - 2).clamp(0, totalDays - 5);
    int endIndex = (startIndex + 5).clamp(0, totalDays);

    final visibleDates = allDates.sublist(startIndex, endIndex);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeHeader(
          title: 'Select Date',
          subtitle: 'Set Manual',
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.utc(2026),
            );
            if (picked != null) onChanged(picked);
          },
        ),
        const SizedBox(height: 16),

        SizedBox(
          height: 62,
          child: Row(
            children: [
              IconButton(
                onPressed: selectedIndex > 0
                    ? () => onChanged(allDates[selectedIndex - 1])
                    : null,
                icon: const Icon(Icons.chevron_left, size: 28),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: visibleDates.map((date) {
                    final isSelected = DateUtils.isSameDay(date, selectedDate);
                    return GestureDetector(
                      onTap: () => onChanged(date),
                      child: Container(
                        width: isSelected ? 55 : 43,
                        height: isSelected ? 62 : 48,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF0D6EFD)
                              : const Color(0xFFF0F2F5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat('E').format(date),
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontSize: isSelected ? 14 : 12,
                              ),
                            ),
                            Text(
                              DateFormat('dd').format(date),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: isSelected ? 18 : 14,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              IconButton(
                onPressed: selectedIndex < totalDays - 1
                    ? () => onChanged(allDates[selectedIndex + 1])
                    : null,
                icon: const Icon(Icons.chevron_right, size: 28),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

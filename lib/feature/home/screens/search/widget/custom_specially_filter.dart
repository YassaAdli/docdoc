import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:flutter/material.dart';

class CustomSpeciallyFilter extends StatefulWidget {
  final int initialSelectedIndex;
  final Function(Map<String, dynamic>) onSelect;
  const CustomSpeciallyFilter({
    super.key,
    required this.onSelect,
    this.initialSelectedIndex = 0,
  });

  @override
  State<CustomSpeciallyFilter> createState() => _CustomSpeciallyFilterState();
}

class _CustomSpeciallyFilterState extends State<CustomSpeciallyFilter> {
  late int selectedIndex;
  final List<Map<String, dynamic>> specializations = [
    {"id": 11, "name": "General"},
    {"id": 4, "name": "ENT"},
    {"id": 5, "name": "Pediatric"},
    {"id": 8, "name": "Urologist"},
    {"id": 2, "name": "Dentistry"},
    {"id": 9, "name": "Intestine"},
    {"id": 6, "name": "Histologist"},
    {"id": 10, "name": "Hepatology"},
    {"id": 1, "name": "Cardiologist"},
    {"id": 3, "name": "Neurologic"},
    {"id": 1, "name": "Pulmonary"},
    {"id": 7, "name": "Optometry"},
  ];
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: specializations.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final bool isSelected = selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.onSelect(specializations[index]);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                minimumSize: const Size(65, 41),
                maximumSize: const Size(125, 41),
                backgroundColor: isSelected
                    ? ColorManager.primaryColor
                    : ColorManager.surfaceText,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Text(
                maxLines: 1,
                specializations[index]['name'],
                style: TextStyle(
                  color: isSelected ? ColorManager.white : ColorManager.text50,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

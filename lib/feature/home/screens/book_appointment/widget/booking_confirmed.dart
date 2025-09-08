import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:flutter/material.dart';

class BookingConfirmed extends StatelessWidget {
  const BookingConfirmed({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle, color: ColorManager.fillGreen, size: 65),
          SizedBox(height: 28),
          Text(
            'Booking Confirmed',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ColorManager.text100,
            ),
          ),
        ],
      ),
    );
  }
}

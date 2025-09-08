import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:Docdoc/feature/home/logic/booking/booking_cubit.dart';
import 'package:Docdoc/feature/home/logic/booking/booking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPaymentRadio extends StatelessWidget {
  const CustomPaymentRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Option',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorManager.text100,
              ),
            ),
            const SizedBox(height: 20),

            // Credit Card
            ListTile(
              leading: Radio<String>(
                activeColor: ColorManager.primaryColor,
                side: BorderSide(color: ColorManager.primaryColor, width: 1),
                value: "Credit Card",
                groupValue: state.paymentMethod,
                onChanged: (value) {
                  context.read<AppointmentCubit>().selectPayment(value!);
                },
              ),
              title: const Text(
                "Credit Card",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            if (state.paymentMethod == "Credit Card") ...[
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Column(
                  children: [
                    _buildCardOption(TImage.bank1, "Master Card"),
                    Divider(),
                    _buildCardOption(TImage.bank2, "American Express"),
                    Divider(),
                    _buildCardOption(TImage.bank3, "Capital One"),
                    Divider(),
                    _buildCardOption(TImage.bank4, "Barclays"),
                  ],
                ),
              ),
            ],

            // Bank Transfer
            ListTile(
              leading: Radio<String>(
                activeColor: ColorManager.primaryColor,
                side: BorderSide(color: ColorManager.primaryColor, width: 1),
                value: "Bank Transfer",
                groupValue: state.paymentMethod,
                onChanged: (value) {
                  context.read<AppointmentCubit>().selectPayment(value!);
                },
              ),
              title: const Text(
                "Bank Transfer",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            if (state.paymentMethod == "Bank Transfer") ...[
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: _buildCardOption(TImage.bankTransfer, "Bank Transfer"),
              ),
            ],

            // Paypal
            ListTile(
              leading: Radio<String>(
                activeColor: ColorManager.primaryColor,
                side: BorderSide(color: ColorManager.primaryColor, width: 1),
                value: "PayPal",
                groupValue: state.paymentMethod,
                onChanged: (value) {
                  context.read<AppointmentCubit>().selectPayment(value!);
                },
              ),
              title: const Text(
                "PayPal",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            if (state.paymentMethod == "PayPal") ...[
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: _buildCardOption(TImage.paypal, "PayPal"),
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildCardOption(String imagePath, String title) {
    return Row(
      children: [
        Image.asset(imagePath, width: 40, height: 40),
        const SizedBox(width: 12),
        Text(title),
      ],
    );
  }
}

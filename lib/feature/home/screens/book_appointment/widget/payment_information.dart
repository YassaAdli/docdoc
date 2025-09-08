import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:flutter/material.dart';

class PaymentInformation extends StatelessWidget {
  const PaymentInformation({super.key, this.title = 'Credit Card'});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Information',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorManager.black,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                title == "Credit Card"
                    ? TImage.bank1
                    : title == "Bank Transfer"
                    ? TImage.bankTransfer
                    : TImage.paypal,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? 'Credit Card',

                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: ColorManager.blackColor,
                  ),
                ),
                const Text(
                  maxLines: 1,
                  '***** ***** ***** 37842',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: ColorManager.body,
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                side: WidgetStateProperty.all(
                  BorderSide(color: ColorManager.primaryColor, width: 1),
                ),
                backgroundColor: WidgetStateProperty.all(ColorManager.white),
                shadowColor: WidgetStateProperty.all(Colors.transparent),
              ),
              child: Text(
                'Change',
                style: TextStyle(
                  color: ColorManager.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

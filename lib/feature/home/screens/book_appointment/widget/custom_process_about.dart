import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:flutter/material.dart';

class CustomProcessAbout extends StatelessWidget {
  const CustomProcessAbout({super.key, this.process = 1});
  final int process;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: process != 1
                    ? ColorManager.fillGreen
                    : ColorManager.primaryColor,
              ),
              child: const Center(
                child: Text(
                  '1',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.text10,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Center(
              child: Text(
                'Date & Time',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: process != 1
                      ? ColorManager.fillGreen
                      : ColorManager.text100,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 69,
          child: Divider(
            color: process == 3 ? ColorManager.fillGreen : ColorManager.text20,
            height: 4,
          ),
        ),
        Column(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: process > 1 && process < 3
                    ? ColorManager.primaryColor
                    : process == 3
                    ? ColorManager.fillGreen
                    : ColorManager.text20,
              ),
              child: const Center(
                child: Text(
                  '2',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.text10,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Center(
              child: Text(
                'Payment',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: process == 2
                      ? ColorManager.text100
                      : process == 3
                      ? ColorManager.fillGreen
                      : ColorManager.text20,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 69,
          child: Divider(color: ColorManager.text20, height: 2),
        ),
        Column(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: process == 3
                    ? ColorManager.primaryColor
                    : ColorManager.text20,
              ),
              child: const Center(
                child: Text(
                  '3',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.text10,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Center(
              child: Text(
                'Summary',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: process == 3
                      ? ColorManager.text100
                      : ColorManager.text20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

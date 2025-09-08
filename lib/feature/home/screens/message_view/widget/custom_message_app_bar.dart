import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CustomMessageAppBar extends StatelessWidget {
  const CustomMessageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorManager.text20, width: 1),
          ),
          child: const Center(
            child:  Icon(
              Icons.keyboard_arrow_left_rounded,
              color: Colors.black,
              size: 28,
            ),
          ),
        ),
        const Expanded(
          child: Text(
            textAlign: TextAlign.center,
            'Message' ,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorManager.text20, width: 1),
          ),
          child:  Center(
            child:  SvgPicture.asset(TImage.messageAdd,height: 20,width: 20,colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),),
          ),
        ),
      ],
    );
  }
}

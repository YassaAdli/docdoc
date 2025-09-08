import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalImage extends StatelessWidget {
  const PersonalImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 128,
          width: 128,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(64),
          ),
          child: CircleAvatar(
            backgroundColor: ColorManager.white,
            radius: 60,

            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(TImage.testProfile),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 31,
            width: 31,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: CircleAvatar(
              backgroundColor: ColorManager.surfaceText,
              radius: 15,
              child: Center(child: SvgPicture.asset(TImage.edit)),
            ),
          ),
        ),
      ],
    );
  }
}

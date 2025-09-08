import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomProfileItem extends StatefulWidget {
  const CustomProfileItem({super.key});

  @override
  State<CustomProfileItem> createState() => _CustomProfileItemState();
}

class _CustomProfileItemState extends State<CustomProfileItem> {
  final List<Map<String, dynamic>> items = [
    {
      "icon": TImage.personalCard,
      "label": "Personal Information",
      "imageColor": ColorManager.fillBlue,
      "color": ColorManager.surfaceBlue,
      "route": AppRouter.personalInformationView,
    },
    {
      "icon": TImage.directBox,
      "label": "My Test & Diagnostic",
      "imageColor": ColorManager.fillGreen,
      "color": ColorManager.surfaceGreen,
      "route": AppRouter.personalInformationView,
    },
    {
      "icon": TImage.wallet,
      "label": "Payment",
      "imageColor": ColorManager.fillRed,
      "color": ColorManager.surfaceRed,
      "route": AppRouter.personalInformationView,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final type = items[index];
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(items[index]["route"]);
                },
                child: Row(
                  children: [
                    // Icon Container
                    Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: type["color"],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              type["icon"],
                              color: type["imageColor"],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                    const SizedBox(width: 16),

                    // Label
                    Expanded(
                      child: Text(
                        type["label"],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.text100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}

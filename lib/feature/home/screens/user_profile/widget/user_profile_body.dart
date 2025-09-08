import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/service_locator.dart';
import 'package:Docdoc/core/utils/shared_pref_service.dart';
import 'package:Docdoc/core/utils/sizeConfig.dart';
import 'package:Docdoc/feature/home/screens/user_profile/widget/custom_profile_app_bar.dart';
import 'package:Docdoc/feature/home/screens/user_profile/widget/custom_profile_item.dart';
import 'package:Docdoc/feature/home/screens/user_profile/widget/custom_toggle_button.dart';
import 'package:Docdoc/feature/home/screens/user_profile/widget/personal_image.dart';
import 'package:flutter/material.dart';

class UserProfileBody extends StatelessWidget {
  final VoidCallback onTapAppointment;
  const UserProfileBody({super.key, required this.onTapAppointment});

  @override
  Widget build(BuildContext context) {
    final sharedPref = getIt<SharedPrefService>();
    String? username = sharedPref.getValue<String>("username");
    String? email = sharedPref.getValue<String>("email");

    SizeConfig.init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomProfileAppBar(),
        Container(
          width: double.infinity,
          height: SizeConfig.screenHeight * 0.7,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          clipBehavior: Clip.none,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 98),
                        Text(
                          '$username',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.black,
                          ),
                        ),
                        Text(
                          '$email',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.text20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    CustomToggleButton(onTapAppointment: onTapAppointment),
                    SizedBox(height: 24),
                    CustomProfileItem(),
                  ],
                ),
                Positioned(
                  top: -55,
                  right: 0,
                  left: 0,
                  child: Center(child: PersonalImage()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

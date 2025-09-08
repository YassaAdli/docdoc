import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/feature/home/screens/user_profile/widget/user_profile_body.dart';
import 'package:flutter/material.dart';

class UserProfileView extends StatelessWidget {
  final VoidCallback onTapAppointment;
  const UserProfileView({super.key, required this.onTapAppointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: SafeArea(child: UserProfileBody(onTapAppointment: onTapAppointment,)),
    );
  }
}

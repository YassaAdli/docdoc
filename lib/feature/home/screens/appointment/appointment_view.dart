import 'package:Docdoc/feature/home/screens/appointment/widget/appointment_view_body.dart';
import 'package:flutter/material.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: AppointmentViewBody(),
        ),
      ),
    );
  }
}

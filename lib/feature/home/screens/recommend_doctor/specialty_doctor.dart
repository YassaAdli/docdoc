import 'package:Docdoc/feature/home/screens/recommend_doctor/widget/specialty_doctor_body.dart';
import 'package:flutter/material.dart';

class SpecialtyDoctor extends StatelessWidget {
  const SpecialtyDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
          child: SpecialtyDoctorBody(),
        ),
      ),
    );
  }
}

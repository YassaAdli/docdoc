import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/feature/home/screens/homescreen/widget/custom_home_app_bar.dart';
import 'package:Docdoc/feature/home/screens/homescreen/widget/custom_home_banner.dart';
import 'package:Docdoc/feature/home/screens/homescreen/widget/doctor_speciality.dart';
import 'package:Docdoc/feature/home/screens/homescreen/widget/home_header.dart';
import 'package:Docdoc/feature/home/screens/homescreen/widget/home_recommend_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomHomeAppBar(),
            const SizedBox(height: 16),
            const CustomHomeBanner(),
            const SizedBox(height: 24),
            HomeHeader(
              title: 'Doctor Speciality',
              onTap: () {
                GoRouter.of(context).push(AppRouter.doctorFilter);
              },
              subtitle: 'See All',
            ),
            const SizedBox(height: 16),
            const DoctorSpeciality(),
            const SizedBox(height: 24),
            HomeHeader(
              title: 'Recommendation Doctor',
              onTap: () {
                GoRouter.of(context).push(AppRouter.recommendationDoctor);
              },
              subtitle: 'See All',
            ),
            const SizedBox(height: 16),
            const HomeRecommendListView(),
          ],
        ),
      ),
    );
  }
}

import 'package:Docdoc/feature/home/screens/recommend_doctor/widget/custom_recommend_app_bar.dart';
import 'package:Docdoc/feature/home/screens/recommend_doctor/widget/custom_recommend_search.dart';
import 'package:Docdoc/feature/home/screens/recommend_doctor/widget/recommend_page_list_view.dart';
import 'package:flutter/material.dart';

class RecommendationDoctorBody extends StatelessWidget {
  const RecommendationDoctorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          const CustomRecommendAppBar(),
          const SizedBox(height: 32),
          const CustomRecommendSearch(),
          const SizedBox(height: 24),
          const Expanded(child: RecommendPageListView()),
        ],
      ),
    );
  }
}

import 'package:Docdoc/feature/home/screens/recommend_doctor/widget/custom_bottom_sheet.dart';
import 'package:Docdoc/feature/home/screens/recommend_doctor/widget/search.dart';
import 'package:flutter/material.dart';

class CustomRecommendSearch extends StatefulWidget {
  const CustomRecommendSearch({super.key});

  @override
  State<CustomRecommendSearch> createState() => _CustomRecommendSearchState();
}

class _CustomRecommendSearchState extends State<CustomRecommendSearch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Search(),
        const SizedBox(width: 16),
        const CustomBottomSheet(),
      ],
    );
  }
}

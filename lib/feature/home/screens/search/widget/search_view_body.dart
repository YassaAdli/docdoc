import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/feature/home/logic/doctor_mode/doctor_mode_cubit.dart';
import 'package:Docdoc/feature/home/logic/specialization_doctor/specialization_doctor_bloc.dart';
import 'package:Docdoc/feature/home/screens/recommend_doctor/widget/custom_recommend_search.dart';
import 'package:Docdoc/feature/home/screens/search/widget/custom_search_list_view.dart';
import 'package:Docdoc/feature/home/screens/search/widget/custom_specially_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  int found = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              textAlign: TextAlign.center,
              'Search',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 32),
          const CustomRecommendSearch(),
          const SizedBox(height: 16),
          CustomSpeciallyFilter(
            onSelect: (Map<String, dynamic> p1) {
              final specializationId = p1['id'];
              if (specializationId == null || specializationId == 11) {
                context.read<DoctorModeCubit>().showSearch();
                setState(() {
                  found = 0;
                });
              } else {
                context.read<DoctorModeCubit>().showFilter();
                context.read<SpecializationDoctorBloc>().add(
                  GetDoctorsBySpecialization(specializationId),
                );
              }
            },
          ),
          const SizedBox(height: 16),
          found > 0
              ? Text(
                  found > 0 ? '$found Found' : '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.blackColor,
                  ),
                )
              : const SizedBox(),
          Expanded(
            child: CustomSearchListView(
              onSelect: (int p1) {
                setState(() {
                  found = p1;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

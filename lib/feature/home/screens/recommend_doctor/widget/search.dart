import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:Docdoc/feature/home/logic/doctor_mode/doctor_mode_cubit.dart';
import 'package:Docdoc/feature/home/logic/search_doctor/search_doctor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SearchBar(
        onChanged: (value) {
          if (value.isNotEmpty) {
            context.read<DoctorModeCubit>().showSearch();
            context.read<SearchDoctorBloc>().add(SearchDoctorByName(value));
          } else {
            context.read<DoctorModeCubit>().showAll();
          }
        },
        hintText: 'Search',
        hintStyle: WidgetStateProperty.all(
          TextStyle(color: ColorManager.text50),
        ),
        leading: SvgPicture.asset(
          TImage.search,
          width: 24,
          height: 24,
          color: ColorManager.text50,
        ),
        constraints: BoxConstraints(
          maxHeight: 46,
          maxWidth: double.infinity,
          minHeight: 46,
          minWidth: double.infinity,
        ),
        backgroundColor: WidgetStateProperty.all(ColorManager.surfaceText),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}

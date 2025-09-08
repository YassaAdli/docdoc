import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/feature/home/logic/doctor_mode/doctor_mode_cubit.dart';
import 'package:Docdoc/feature/home/logic/specialization_doctor/specialization_doctor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetBody extends StatefulWidget {
  const BottomSheetBody({super.key});

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  int selectedIndex = 0;
  final List<Map<String, dynamic>> specializations = [
    {"id": 11, "name": "General"},
    {"id": 4, "name": "ENT"},
    {"id": 5, "name": "Pediatric"},
    {"id": 8, "name": "Urologist"},
    {"id": 2, "name": "Dentistry"},
    {"id": 9, "name": "Intestine"},
    {"id": 6, "name": "Histologist"},
    {"id": 10, "name": "Hepatology"},
    {"id": 1, "name": "Cardiologist"},
    {"id": 3, "name": "Neurologic"},
    {"id": 1, "name": "Pulmonary"},
    {"id": 7, "name": "Optometry"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 45),
        const Text(
          'Sort By',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ColorManager.text100,
          ),
        ),
        const SizedBox(height: 16),
        const Divider(
          color: ColorManager.surfaceText,
          height: 2,
          endIndent: 12,
          indent: 12,
        ),
        const SizedBox(height: 33),
        const Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Speciality',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorManager.text100,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: specializations.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final bool isSelected = selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 10,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: const Size(65, 41),
                      maximumSize: const Size(125, 41),
                      backgroundColor: isSelected
                          ? ColorManager.primaryColor
                          : ColorManager.surfaceText,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Text(
                      maxLines: 1,
                      specializations[index]['name'],
                      style: TextStyle(
                        color: isSelected
                            ? ColorManager.white
                            : ColorManager.text50,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        // const Padding(
        //   padding: const EdgeInsets.only(left: 24.0),
        //   child: Align(
        //     alignment: Alignment.centerLeft,
        //     child: Text(
        //       'Rating',
        //       style: TextStyle(
        //         fontSize: 16,
        //         fontWeight: FontWeight.w500,
        //         color: ColorManager.text100,
        //       ),
        //     ),
        //   ),
        // ),
        // const SizedBox(height: 24),
        // Padding(
        //   padding: const EdgeInsets.only(left: 24.0),
        //   child: SizedBox(
        //     height: 50,
        //     child: ListView.builder(
        //       itemCount: 5,
        //       scrollDirection: Axis.horizontal,
        //       itemBuilder: (context, index) {
        //         final bool isSelected = selectedIndex == index;
        //         return Padding(
        //           padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
        //           child: ElevatedButton(
        //             onPressed: () {
        //               setState(() {
        //                 selectedIndex = index;
        //               });
        //             },
        //             style: ElevatedButton.styleFrom(
        //               elevation: 0,
        //               minimumSize: const Size(41, 41),
        //               maximumSize: const Size(125, 41),
        //               backgroundColor: isSelected
        //                   ? ColorManager.primaryColor
        //                   : ColorManager.surfaceText,
        //               shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(24),
        //               ),
        //             ),
        //             child: Row(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 Icon(
        //                   Icons.star,
        //                   color: isSelected
        //                       ? ColorManager.white
        //                       : ColorManager.text50,
        //                   size: 19,
        //                 ),
        //                 Text(
        //                   'All',
        //                   style: TextStyle(
        //                     color: isSelected
        //                         ? ColorManager.white
        //                         : ColorManager.text50,
        //                     fontSize: 14,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24),
          child: SizedBox(
            height: 52,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final specializationId = specializations[selectedIndex]['id'];
                if (specializationId == null || specializationId == 11) {
                  context.read<DoctorModeCubit>().showAll();
                } else {
                  context.read<DoctorModeCubit>().showFilter();
                  context.read<SpecializationDoctorBloc>().add(
                    GetDoctorsBySpecialization(specializationId),
                  );
                }
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: ColorManager.primaryColor,
              ),
              child: const Text(
                'Done',
                style: TextStyle(color: ColorManager.white, fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

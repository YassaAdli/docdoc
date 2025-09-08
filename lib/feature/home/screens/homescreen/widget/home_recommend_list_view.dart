import 'package:Docdoc/core/function/custom_snack_bar.dart';
import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/widget/custom_error_message.dart';
import 'package:Docdoc/feature/home/logic/doctor/doctor_bloc.dart';
import 'package:Docdoc/feature/home/screens/homescreen/widget/custom_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeRecommendListView extends StatelessWidget {
  const HomeRecommendListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorBloc, DoctorState>(
      listener: (context, state) async {
        if (state is DoctorFailure) {
          if (state.message == 'Internal Server Error, please try later') {
            customSnackBar(context, 'Your session ended, please login again');
            await Future.delayed(const Duration(seconds: 2));
            if(!context.mounted) return;
            GoRouter.of(context).go(AppRouter.loginView);
          }
        }
      },
      builder: (BuildContext context, state) {
        if (state is DoctorSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (context, index) {
              return CustomDoctorCard(doctor: state.response[index]);
            },
          );
        } else if (state is DoctorFailure) {
          return Center(
            child: Column(
              children: [
                CustomErrorMessage(errMessage: state.message),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<DoctorBloc>().add(GetDoctor());
                  },
                  child: Text('Refresh'),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

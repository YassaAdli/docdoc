import 'package:Docdoc/core/function/custom_snack_bar.dart';
import 'package:Docdoc/feature/home/logic/user_information/user_information_bloc.dart';
import 'package:Docdoc/feature/home/screens/user_profile/widget/personal_information_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: BlocConsumer<UserInformationBloc, UserInformationState>(
            builder: (context, state) {
              if (state is GetUserInformationLoading) {
                return const Center(child: CircularProgressIndicator());
              }else if (state is UserInformationLoaded) {
                final user = state.userResponse.data?[0];
                return PersonalInformationBody(user: user);
              }
              return const PersonalInformationBody();
            },
            listener: (BuildContext context, UserInformationState state) {
              if (state is UserInformationFailure) {
                return customSnackBar(context, state.message);
              }
            },
          ),
        ),
      ),
    );
  }
}

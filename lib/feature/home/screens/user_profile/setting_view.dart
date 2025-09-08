import 'package:Docdoc/core/utils/service_locator.dart';
import 'package:Docdoc/feature/authentication/logic/logout/logout_cubit.dart';
import 'package:Docdoc/feature/home/screens/user_profile/widget/setting_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<LogoutCubit>(),
      child: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: SettingViewBody(),
          ),
        ),
      ),
    );
  }
}

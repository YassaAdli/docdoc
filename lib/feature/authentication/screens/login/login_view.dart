import 'package:Docdoc/core/utils/service_locator.dart';
import 'package:Docdoc/feature/authentication/logic/login/login_cubit.dart';
import 'package:Docdoc/feature/authentication/screens/login/Login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<LoginCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(child: SingleChildScrollView(child: LoginViewBody())),
      ),
    );
  }
}

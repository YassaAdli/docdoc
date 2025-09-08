import 'package:Docdoc/core/utils/service_locator.dart';
import 'package:Docdoc/feature/authentication/logic/register/register_cubit.dart';
import 'package:Docdoc/feature/authentication/screens/signup/widget/signup_body.dart';
import 'package:Docdoc/feature/authentication/widget/auth_bottom.dart';
import 'package:Docdoc/feature/authentication/widget/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<RegisterCubit>(),
      child: const Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 50,
                bottom: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthHeader(
                    title: 'Create Account',
                    subTitle:
                        'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  ),
                  SizedBox(height: 32),
                  SignupBody(),
                  SizedBox(height: 45),
                  AuthBottom(isSignup: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:Docdoc/core/function/custom_snack_bar.dart';
import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/utils/sizeConfig.dart';
import 'package:Docdoc/core/widget/custom_button.dart';
import 'package:Docdoc/core/widget/custom_text_field.dart';
import 'package:Docdoc/feature/authentication/logic/login/login_cubit.dart';
import 'package:Docdoc/feature/authentication/logic/login/login_state.dart';
import 'package:Docdoc/feature/authentication/widget/auth_bottom.dart';
import 'package:Docdoc/feature/authentication/widget/auth_header.dart';
import 'package:Docdoc/feature/authentication/widget/remember.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  bool rememberMe = false;

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    context.read<LoginCubit>().loadRememberedCredentials();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 30.0,
        top: 50,
        bottom: 24,
      ),
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthHeader(),
            SizedBox(height: 32),
            CustomTextField(
              hintText: 'Email',

              controller: emailController,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Field is required';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Password',
              controller: passwordController,
              obscureText: true,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Field is required';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 16),
            Remember(
              value: rememberMe,
              onChanged: (value) {
                setState(() {
                  rememberMe = value ?? false;
                });
              },
            ),
            const SizedBox(height: 32),
            BlocConsumer<LoginCubit, LoginState>(
              builder: (BuildContext context, LoginState state) {
                return state is LoginLoading
                    ? CustomButton(
                        text: 'Login',
                        isLoading: true,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            context.read<LoginCubit>().login(
                              emailController.text,
                              passwordController.text,
                              remember: rememberMe,
                            );
                          } else {
                            autoValidateMode = AutovalidateMode.always;
                          }
                        },
                      )
                    : CustomButton(
                        text: 'Login',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            context.read<LoginCubit>().login(
                              emailController.text,
                              passwordController.text,
                              remember: rememberMe,
                            );
                          } else {
                            autoValidateMode = AutovalidateMode.always;
                          }
                        },
                      );
              },
              listener: (BuildContext context, LoginState state) {
                if (state is LoginSuccess) {
                  GoRouter.of(context).go(AppRouter.homeScreen);
                } else if (state is LoginFailure) {
                  customSnackBar(context, state.message);
                }else if (state is AuthRemembered) {
                  emailController.text = state.email;
                  passwordController.text = state.password;
                  setState(() {
                    rememberMe = true;
                  });
                }
              },
            ),
            SizedBox(height: 45),
            AuthBottom(),
          ],
        ),
      ),
    );
  }
}

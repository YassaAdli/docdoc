import 'package:Docdoc/core/function/custom_snack_bar.dart';
import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/utils/validator.dart';
import 'package:Docdoc/core/widget/custom_button.dart';
import 'package:Docdoc/core/widget/custom_text_field.dart';
import 'package:Docdoc/feature/authentication/logic/register/register_cubit.dart';
import 'package:Docdoc/feature/authentication/logic/register/register_state.dart';
import 'package:Docdoc/feature/authentication/screens/signup/widget/custom_gender_dropdown.dart';
import 'package:Docdoc/feature/authentication/screens/signup/widget/custom_phone_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String? gender;
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomTextField(
            hintText: 'Name',
            validator: Validators.validateName,
            keyboardType: TextInputType.name,
            controller: nameController,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: Validators.validateEmail,
          ),
          const SizedBox(height: 16),
          CustomPhoneTextField(phoneController: phoneController),
          const SizedBox(height: 16),
          CustomGenderDropdown(
            gender: gender,
            onChanged: (value) {
              setState(() {
                gender = value;
              });
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            validator: Validators.validatePassword,
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: confirmPasswordController,
            validator: (value) => Validators.validateConfirmPassword(
              value,
              passwordController.text,
            ),
            hintText: 'password Confirmation',
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 32),
          BlocConsumer<RegisterCubit, RegisterState>(
            builder: (BuildContext context, state) {
              return (state is RegisterLoading)
                  ? CustomButton(
                      isLoading: true,
                      text: 'Create Account',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          print(gender);
                          context.read<RegisterCubit>().register(
                            emailController.text,
                            passwordController.text,
                            nameController.text,
                            phoneController.text,
                            gender!,
                            confirmPasswordController.text,
                          );
                        } else {
                          autoValidateMode = AutovalidateMode.always;
                        }
                      },
                    )
                  : CustomButton(
                      text: 'Create Account',

                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          print(gender);
                          context.read<RegisterCubit>().register(
                            emailController.text,
                            passwordController.text,
                            nameController.text,
                            phoneController.text,
                            gender!,
                            confirmPasswordController.text,
                          );
                        } else {
                          autoValidateMode = AutovalidateMode.always;
                        }
                      },
                    );
            },
            listener: (BuildContext context, state) {
              if (state is RegisterSuccess) {
                GoRouter.of(context).push(AppRouter.homeScreen);
              } else if (state is RegisterFailure) {
                customSnackBar(context, state.message);
              }
            },
          ),
        ],
      ),
    );
  }
}

import 'package:Docdoc/core/function/custom_snack_bar.dart';
import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/validator.dart';
import 'package:Docdoc/core/widget/custom_button.dart';
import 'package:Docdoc/core/widget/custom_text_field.dart';
import 'package:Docdoc/feature/authentication/screens/signup/widget/custom_gender_dropdown.dart';
import 'package:Docdoc/feature/authentication/screens/signup/widget/custom_phone_text_field.dart';
import 'package:Docdoc/feature/home/data/model/user/user.dart';
import 'package:Docdoc/feature/home/logic/user_information/user_information_bloc.dart';
import 'package:Docdoc/feature/home/screens/doctordetails/widget/custom_app_bar.dart';
import 'package:Docdoc/feature/home/screens/user_profile/widget/personal_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PersonalInformationBody extends StatefulWidget {
  const PersonalInformationBody({super.key, this.user});
  final User? user;

  @override
  State<PersonalInformationBody> createState() =>
      _PersonalInformationBodyState();
}

class _PersonalInformationBodyState extends State<PersonalInformationBody> {
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
  void initState() {
    super.initState();
    nameController.text = widget.user?.name ?? '';
    emailController.text = widget.user?.email ?? '';
    phoneController.text = widget.user?.phone ?? '';
    gender = widget.user?.gender;
  }

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
          const CustomAppBar(title: 'Personal Information'),
          const SizedBox(height: 48),
          const PersonalImage(),
          const SizedBox(height: 50),
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
            gender: widget.user?.gender == 'male' ? '0' : '1',
            onChanged: (value) {
              setState(() {
                gender = value;
              });
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'When you set up your personal information settings, you should take care to provide accurate information.',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: ColorManager.body,
            ),
          ),
          Spacer(),
          BlocConsumer<UserInformationBloc, UserInformationState>(
            builder: (BuildContext context, state) {
              return state is UpdateUserInformationLoading
                  ? CustomButton(
                      isLoading: true,
                      text: 'Save',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          final oldEmail = widget.user?.email ?? '';
                          final oldPhone = widget.user?.phone ?? '';

                          final newEmail = emailController.text;
                          final newPhone = phoneController.text;

                          if (newEmail == oldEmail && newPhone == oldPhone) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'You must change email or phone to update your information',
                                ),
                              ),
                            );
                            return;
                          }
                          print(
                            'name: ${nameController.text},email: $newEmail,phone: $newPhone,gender: $gender',
                          );

                          context.read<UserInformationBloc>().add(
                            UpdateUserInformation(
                              User(
                                name: nameController.text,
                                email: newEmail,
                                phone: newPhone,
                                gender: gender ,
                              ),
                            ),
                          );
                        } else {
                          setState(() {
                            autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                    )
                  : CustomButton(
                      text: 'Save',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          final oldEmail = widget.user?.email ?? '';
                          final oldPhone = widget.user?.phone ?? '';

                          final newEmail = emailController.text;
                          final newPhone = phoneController.text;

                          if (newEmail == oldEmail && newPhone == oldPhone) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'You must change email or phone to update your information',
                                ),
                              ),
                            );
                            return;
                          }
                          print(
                            'name: ${nameController.text},email: $newEmail,phone: $newPhone,gender: $gender',
                          );

                          context.read<UserInformationBloc>().add(
                            UpdateUserInformation(
                              User(
                                id: null,
                                name: nameController.text,
                                email: newEmail,
                                phone: newPhone,
                                gender: gender,
                              ),
                            ),
                          );
                        } else {
                          setState(() {
                            autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                    );
            },

            listener: (BuildContext context, state) {
              if (state is UserInformationUpdated) {
                customSnackBar(context, "Updated successfully");
                GoRouter.of(context).pop();
              } else if (state is UpdateUserInformationFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('change email or pass')));
              }
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

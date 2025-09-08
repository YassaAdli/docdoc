import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/utils/color_manage.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:Docdoc/feature/authentication/widget/custom_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthBottom extends StatelessWidget {
  const AuthBottom({super.key, this.isSignup = false});
  final bool isSignup;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: Divider(thickness: 1, color: ColorManager.textColor),
            ),
            Text(
              ' Or sign in with ',
              style: TextStyle(
                color: ColorManager.textColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(
              child: Divider(thickness: 1, color: ColorManager.textColor),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomLogo(image: TImage.google),
            SizedBox(width: 32),
            CustomLogo(image: TImage.facebook),
            SizedBox(width: 32),
            CustomLogo(image: TImage.apple),
          ],
        ),
        const SizedBox(height: 32),
        RichText(
          text: const TextSpan(
            text: 'By logging, you agree to our  ',
            style: TextStyle(color: ColorManager.textColor),
            children: [
              TextSpan(
                text: 'Terms & Conditions',
                style: TextStyle(color: ColorManager.blackColor),
              ),
              TextSpan(
                text: ' and  ',
                style: TextStyle(color: ColorManager.textColor),
              ),
              TextSpan(
                text: 'PrivacyPolicy.',
                style: TextStyle(color: ColorManager.blackColor),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        isSignup
            ? const SizedBox()
            : Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account yet? ',
                    style: const TextStyle(color: ColorManager.textColor),
                    children: [
                      TextSpan(
                        text: 'Sign Up ',
                        style: const TextStyle(
                          color: ColorManager.primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            GoRouter.of(context).push(AppRouter.registerView);
                          },
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
      ],
    );
  }
}

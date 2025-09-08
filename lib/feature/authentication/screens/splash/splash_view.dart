import 'package:Docdoc/core/utils/add_router.dart';
import 'package:Docdoc/core/utils/image_data.dart';
import 'package:Docdoc/core/utils/service_locator.dart';
import 'package:Docdoc/feature/authentication/data/repositories/onboarding_repository.dart';
import 'package:Docdoc/feature/authentication/logic/onboarding/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          OnboardingCubit(getIt<OnboardingRepository>())..checkFirstTime(),
      child: BlocListener<OnboardingCubit, OnboardingState>(
        listener: (BuildContext context, state) {
          if (state is AuthSkip) {
            GoRouter.of(context).go(AppRouter.homeScreen);
          } else if (state is OnboardingShow) {
            GoRouter.of(context).go(AppRouter.onboardingView);
          } else if (state is OnboardingSkip) {
            GoRouter.of(context).go(AppRouter.loginView);
          }
        },
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(TImage.logoBackground),
                fit: BoxFit.contain,
              ),
            ),
            child: Center(child: Image.asset(TImage.logo)),
          ),
        ),
      ),
    );
  }
}

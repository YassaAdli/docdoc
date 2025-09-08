import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/onboarding_repository.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingRepository repository;

  OnboardingCubit(this.repository) : super(OnboardingInitial());

  Future<void> checkFirstTime() async {
    await Future.delayed(const Duration(seconds: 3));

    final isFirstTime = await repository.isFirstTime();
    final token = await repository.getToken();
    if (token != null) {
      emit(AuthSkip());
    } else if (isFirstTime) {
      emit(OnboardingShow());
      await repository.completeOnboarding();
    } else {
      emit(OnboardingSkip());
    }
  }
}

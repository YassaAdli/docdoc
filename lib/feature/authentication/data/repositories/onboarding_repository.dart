import 'package:Docdoc/core/utils/secure_service.dart';

import '../datasource/onboarding_local_data_source.dart';

class OnboardingRepository {
  final OnboardingLocalDataSource localDataSource;
  final SecureStorage secureStorage;

  OnboardingRepository({
    required this.localDataSource,
    required this.secureStorage,
  });

  Future<bool> isFirstTime() async {
    return await localDataSource.isFirstTime();
  }

  Future<void> completeOnboarding() async {
    await localDataSource.setOnboardingShown();
  }

  Future<String?> getToken() async {
    return await secureStorage.getToken();
  }
}

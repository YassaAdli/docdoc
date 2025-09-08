import 'package:shared_preferences/shared_preferences.dart';

class OnboardingLocalDataSource {
  static const String _firstTimeKey = 'isFirstTime';

  Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstTimeKey) ?? true;
  }

  Future<void> setOnboardingShown() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstTimeKey, false);
  }
}

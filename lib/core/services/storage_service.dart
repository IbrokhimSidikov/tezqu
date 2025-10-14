import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {
  Future<void> setOnboardingComplete(bool value);
  Future<bool> isOnboardingComplete();
  Future<void> clearAll();
}

@LazySingleton(as: StorageService)
class StorageServiceImpl implements StorageService {
  final SharedPreferences _prefs;
  
  static const String _onboardingCompleteKey = 'ONBOARDING_COMPLETE';

  StorageServiceImpl(this._prefs);

  @override
  Future<void> setOnboardingComplete(bool value) async {
    await _prefs.setBool(_onboardingCompleteKey, value);
  }

  @override
  Future<bool> isOnboardingComplete() async {
    return _prefs.getBool(_onboardingCompleteKey) ?? false;
  }

  @override
  Future<void> clearAll() async {
    await _prefs.clear();
  }
}

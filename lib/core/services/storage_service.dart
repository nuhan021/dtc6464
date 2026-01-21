import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // Constants for preference keys
  static const String _isFirstTimer = 'isFirstTimer';
  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';
  static const String _idKey = 'userId';
  static const String _userProfileId = 'userProfileId';

  // Singleton instance for SharedPreferences
  static SharedPreferences? _preferences;

  // Initialize SharedPreferences (call this during app startup)
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Check if tokens exist in local storage
  static bool hasToken() {
    final accessToken = _preferences?.getString(_accessTokenKey);
    return accessToken != null;
  }

  // Save is First timer
  static Future<void> saveIsFirstTimer() async {
    await _preferences?.setBool(_isFirstTimer, true);
  }

  // save userProfileId
  static Future<void> saveUserProfileId(String userProfileId) async {
    await _preferences?.setString(_userProfileId, userProfileId);
  }

  // Save both access token and refresh token to local storage
  static Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required String userId,
  }) async {
    await _preferences?.setString(_accessTokenKey, accessToken);
    await _preferences?.setString(_refreshTokenKey, refreshToken);
    await _preferences?.setString(_idKey, userId);
  }

  // Remove all tokens and user ID from local storage (for logout)
  static Future<void> logoutUser() async {
    await _preferences?.remove(_accessTokenKey);
    await _preferences?.remove(_refreshTokenKey);
    await _preferences?.remove(_idKey);
    // Navigate to the login screen
    // Get.offAllNamed('/login');
  }

  // getter for isFirstTimer
  static bool? get isFirstTimer => _preferences?.getBool(_isFirstTimer);

  // getter userProfileId
  static String? get userProfileId => _preferences?.getString(_userProfileId);

  // Getter for user ID
  static String? get userId => _preferences?.getString(_idKey);

  // Getter for access token
  static String? get accessToken => _preferences?.getString(_accessTokenKey);

  // Getter for refresh token
  static String? get refreshToken => _preferences?.getString(_refreshTokenKey);

  // Check if refresh token exists
  static bool hasRefreshToken() {
    final refreshToken = _preferences?.getString(_refreshTokenKey);
    return refreshToken != null;
  }
}
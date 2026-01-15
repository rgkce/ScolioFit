import 'dart:io';

class ApiConstants {
  // Use 10.0.2.2 for Android Emulator, localhost for iOS/Web/Desktop
  static String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000/api';
    }
    return 'http://localhost:3000/api';
  }

  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String changePassword = '/auth/change-password';

  // Exercise endpoints
  static const String exercises = '/exercises';
  static const String favorites = '/exercises/favorites';
  static const String dailyRoutine = '/exercises/daily-routine';
  static const String toggleFavorite = '/exercises/favorites';
}

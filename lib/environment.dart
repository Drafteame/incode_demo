import 'package:flutter_dotenv/flutter_dotenv.dart';

mixin Environment {
  // Keys required
  static String get fileName => '.env';

  static String get incodeApiUrl => dotenv.env['INCODE_API_URL'] ?? '';
  static String get incodeApiKey => dotenv.env['INCODE_API_KEY'] ?? '';
}

import 'package:flutter_dotenv/flutter_dotenv.dart';

mixin Environment {
  // Keys required
  static String get fileName => '.env';

  static String get incodeApiUrl => dotenv.env['INCODE_API_URL'] ?? '';
  static String get incodeToken => dotenv.env['INCODE_TOKEN'] ?? '';
  static String get incodeExternalId => dotenv.env['INCODE_EXTERNAL_ID'] ?? '';
  static String get incodeConfigurationId =>
      dotenv.env['INCODE_CONFIGURATION_ID'] ?? '';
}

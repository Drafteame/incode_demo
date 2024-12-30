import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:incode_demo/compliance_provider_result.dart';

import 'incode_manager.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppIncode(),
    );
  }
}

class AppIncode extends StatefulWidget {
  const AppIncode({super.key});

  @override
  State<AppIncode> createState() => _AppIncodeState();
}

class _AppIncodeState extends State<AppIncode> {
  late final IncodeStartOnboardingManager _incodeManager;

  @override
  void initState() {
    super.initState();

    _incodeManager = IncodeStartOnboardingManager();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Incode Demo'),
          ElevatedButton(
            onPressed: () {
              // Obtener datos de la API - startOnboarding
              _incodeManager
                  .startFlow(
                token:
                    'eyJhbGciOiJIUzI1NiJ9.eyJleHRlcm5hbFVzZXJJZCI6IjY3N65zJkOGI3YTM4N2FhMmUwN2M2NzQ3YiIsInJvbGUiOiJBQ0NFU1MiLCJUIjoiSSIsImtleVJlZiI6IjYzYzgzMjZlYjVhYzlhMjM1MGJlNjA1OSIsImV4cCI6MTc0MzM1NTgzMiwiaWF0IjoxNzM1NTc5ODMyfQ.3RDwuUuR1ptUnOQBam1n_1die-nhhPembmvLRgEwxSs50',
                externalId: '6772d8b7a387aa2e07c6747b',
                configurationId: '63c8395f93dc5f21fcb6a572',
              )
                  .then((value) {
                if (value is ComplianceProviderError) {
                  debugPrint('INCODE - startFlow onError');
                } else {
                  debugPrint('INCODE - startFlow onSuccess');
                }
              }).catchError((error) {
                debugPrint('INCODE - startFlow onError: $error');
              });
            },
            child: const Text('Start Onboarding'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:incode_demo/compliance_provider_result.dart';
import 'package:incode_demo/environment.dart';

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
                token: Environment.incodeToken,
                externalId: Environment.incodeExternalId,
                configurationId: Environment.incodeConfigurationId,
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

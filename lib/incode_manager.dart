import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:incode_demo/compliance_provider_result.dart';
import 'package:incode_demo/environment.dart';
import 'package:incode_demo/incode_resources_model.dart';
import 'package:onboarding_flutter_wrapper/onboarding_flutter_wrapper.dart';

class IncodeStartOnboardingManager {
  IncodeStartOnboardingManager() {
    _initialize();
  }
  bool _isInitialized = false;

  void _initialize() {
    IncodeOnboardingSdk.init(
      testMode: false,
      apiUrl: '${Environment.incodeApiUrl}/0/',
      apiKey: '',
      onError: (String error) {
        debugPrint('INCODE - initialize error: $error');
        _isInitialized = false;
      },
      onSuccess: () {
        debugPrint('INCODE - initialize onSuccess');
        _isInitialized = true;
        _setUp();
      },
    );
  }

  void _setUp() {
    _setTheme();
    _setLocalizationLanguage();
    _setStrings();
  }

  Future<ComplianceProviderResult> startFlow({
    required String token,
    required String externalId,
    required String configurationId,
  }) {
    final Completer<ComplianceProviderResult> completer =
        Completer<ComplianceProviderResult>();
    if (_isInitialized == false) {
      completer.safeComplete(
        ComplianceProviderError(
          error: Exception(
            IncodeResourcesModel.genericError,
          ),
        ),
      );

      return completer.future;
    }

    final OnboardingSessionConfiguration sessionConfig =
        OnboardingSessionConfiguration(
      token: token,
    );

    final OnboardingRecordSessionConfiguration recordSessionConfig =
        OnboardingRecordSessionConfiguration(
      recordSession: true,
      forcePermission: true,
    );
    IncodeOnboardingSdk.startOnboarding(
      flowConfig: _getFlowConfig(),
      sessionConfig: sessionConfig,
      recordSessionConfig: recordSessionConfig,
      onUserCancelled: () {
        completer.safeComplete(const ComplianceProviderUserCancel());
      },
      onSuccess: () {
        completer.safeComplete(const ComplianceProviderSuccess());
      },
      onError: (String? description) {
        completer.safeComplete(
          _handleError(
            method: 'startOnboarding',
            error: description ?? 'unknown',
          ),
        );
      },
      onOnboardingSessionCreated: (_) {
        debugPrint(
          'INCODE - startOnboarding onOnboardingSessionCreated',
        );
      },
      onIdProcessed: (String ocrData) {
        debugPrint('INCODE - startOnboarding onIdProcessed');
      },
      onIdBackCompleted: (IdScanResult result) {
        debugPrint('INCODE - startOnboarding onIdBackCompleted');
      },
      onIdFrontCompleted: (IdScanResult result) {
        debugPrint('INCODE - startOnboarding onIdFrontCompleted');
      },
      onSelfieScanCompleted: (SelfieScanResult result) {
        debugPrint('INCODE - startOnboarding onSelfieScanCompleted');
      },
      onFaceMatchCompleted: (FaceMatchResult result) {
        debugPrint('INCODE - startOnboarding onFaceMatchCompleted');
      },
      onAntifraudCompleted: (AntifraudResult result) {
        debugPrint('INCODE - startOnboarding onAntifraudCompleted');
      },
      onEvents: (OnEventsResult result) {
        debugPrint('INCODE - startOnboarding onEvents: $result');
      },
    );

    return completer.future;
  }

  OnboardingFlowConfiguration _getFlowConfig() {
    final OnboardingFlowConfiguration flowConfig =
        OnboardingFlowConfiguration();

    flowConfig.addIdScan(
      showTutorials: true,
      idType: IdType.id,
      scanStep: ScanStepType.front,
    );
    flowConfig.addIdScan(
      showTutorials: true,
      idType: IdType.id,
      scanStep: ScanStepType.back,
    );
    flowConfig.addProcessId();
    flowConfig.addSelfieScan(showTutorials: true);
    flowConfig.addFaceMatch();
    return flowConfig;
  }

  ComplianceProviderResult _handleError({
    required String method,
    required String error,
  }) {
    if (IncodeResourcesModel.sdkMaliciousErrors.contains(error)) {
      return ComplianceProviderMaliciousSoftware(
        description: error,
        error: Exception(
          IncodeResourcesModel.genericError,
        ),
      );
    }
    debugPrint('INCODE - $method error: $error');
    return ComplianceProviderError(
      error: Exception(error),
    );
  }
}

void _setLocalizationLanguage() {
  IncodeOnboardingSdk.setLocalizationLanguage(language: 'es')
      .catchError((Object? error, StackTrace stackTrace) {
    debugPrint('INCODE - setLocalizationLanguage $error $stackTrace');
  });
}

void _setTheme() {
  IncodeOnboardingSdk.setTheme(theme: IncodeResourcesModel.theme)
      .catchError((Object? error, StackTrace stackTrace) {
    debugPrint('INCODE - setTheme $error $stackTrace');
  });
}

void _setStrings() {
  IncodeOnboardingSdk.setString(strings: IncodeResourcesModel.strings)
      .catchError((Object? error, StackTrace stackTrace) {
    debugPrint('INCODE - setString $error $stackTrace');
  });
}

extension CompleterEx on Completer<dynamic> {
  void safeComplete<T>([FutureOr<T>? value]) {
    if (!isCompleted) {
      complete(value);
    }
  }
}

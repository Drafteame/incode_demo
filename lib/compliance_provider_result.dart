sealed class ComplianceProviderResult {}

class ComplianceProviderSuccess implements ComplianceProviderResult {
  const ComplianceProviderSuccess();
}

class ComplianceProviderUserCancel implements ComplianceProviderResult {
  const ComplianceProviderUserCancel();
}

class ComplianceProviderMaliciousSoftware implements ComplianceProviderResult {
  const ComplianceProviderMaliciousSoftware({
    required this.description,
    this.error,
  });
  final String description;
  final Object? error;
}

class ComplianceProviderError implements ComplianceProviderResult {
  const ComplianceProviderError({
    this.error,
  });

  final Object? error;
}

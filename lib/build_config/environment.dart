enum Environment {
  dev,
  prod,
}

extension EnvironmentExtensions on Environment {
  bool get useFakeApi {
    switch (this) {
      case Environment.dev:
        return true;
      case Environment.prod:
        return false;
    }
  }
}

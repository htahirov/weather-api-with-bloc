extension ToCelciusExtension on double? {
  double get toCelcius {
    if (this == null) {
      return 0;
    }
    return this! - 273.15;
  }
}

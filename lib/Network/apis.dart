class ApiKeys {
  // BASE URL
  // After you have entered/edited your base url, run the command:
  // flutter pub run build_runner build --delete-conflicting-outputs
  /// مهم لازم تقرا ال تحت
  /// always check is line exist->
  /// baseUrl ??= SharedPreferenceUtil.getString(PrefKey.baseUrl).isEmpty ? ApiKeys.siteUrl:SharedPreferenceUtil.getString(PrefKey.baseUrl);
  /// in generated file _RestClient,

  // to generate the api_services.g.dart file
  // Every time you change the base url, you need to run the above command
  static const String siteUrl = "";
  static const String devUrl = "";
  // ignore: dead_code
  static const String workingUrl = true ? devUrl : siteUrl;

  // API CONNECTION CHECK
  static const String apiConnectionTest = "";
}

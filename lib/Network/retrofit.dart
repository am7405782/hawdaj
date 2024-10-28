// ignore: depend_on_referenced_packages
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:hawdaj/constants/keys_values.dart';
import 'package:hawdaj/constants/preference_utility.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RetroApi {
  Dio dioData() {
    final dio = Dio();
    debugPrint(
        '----------------------<TOKEN>:${SharedPreferenceUtil.getString(PrefKey.login)}');
    debugPrint(
        '----------------------<Current Lan header>:${SharedPreferenceUtil.getString(PrefKey.currentLanguageCode)}');
    debugPrint(
        '----------------------<TOKEN>:${SharedPreferenceUtil.getString(PrefKey.login)}');
    dio.options.headers["Accept"] =
        "application/json"; // Config your dio headers globally
    // dio.options.headers["Authorization"] = "Bearer YOUR_TOKEN";
    dio.options.headers["Authorization"] =
        "Bearer ${SharedPreferenceUtil.getString(PrefKey.login)}";
    dio.options.headers["accept-tokenapi"] =
        "k*RQ=z*2K4@WnA6d2h_&z39?bE9kDszkwh4XTePpU_vA";
    dio.options.headers["accept-language"] =
        SharedPreferenceUtil.getString(PrefKey.currentLanguageCode);
    //accept-tokenapi:k*RQ=z*2K4@WnA6d2h_&z39?bE9kDszkwh4XTePpU_vA
    //accept-language:en
    dio.options.followRedirects = false;
    dio.options.connectTimeout = const Duration(milliseconds: 75000); //5ss
    dio.options.receiveTimeout = const Duration(milliseconds: 75000);
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

    if (!kDebugMode) {
      dio.interceptors.add(ChuckerDioInterceptor());
    }
    return dio;
  }
}

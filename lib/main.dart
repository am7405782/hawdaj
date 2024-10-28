import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hawdaj/Localization/language_localization.dart';
import 'package:hawdaj/Localization/localization_constant.dart';
import 'package:hawdaj/constants/preference_utility.dart';
import 'package:hawdaj/core/service_locator.dart';
import 'package:hawdaj/routing/app_router.dart';
import 'package:oktoast/oktoast.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await SharedPreferenceUtil.getInstance();
  await setupServiceLocator();

  ChuckerFlutter.showOnRelease = true;

  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  // ignore: library_private_types_in_public_api
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((local) => {
          setState(() {
            _locale = local;
          })
        });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (_, child) {
          return GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            child: OKToast(child: Builder(
              builder: (context) {
                return MaterialApp.router(
                  routerConfig: AppRouter.router,
                  title: 'Quick Wash',
                  debugShowCheckedModeBanner: false,
                  // theme: CustomTheme.lightTheme,
                  //  locale: _locale,
                  // supportedLocales: const [
                  //   Locale(english, 'US'),
                  //   Locale(arabic, 'AE'),
                  // ],
                  // localizationsDelegates: const [
                  //   LanguageLocalization.delegate,
                  //   GlobalMaterialLocalizations.delegate,
                  //   GlobalWidgetsLocalizations.delegate,
                  //   GlobalCupertinoLocalizations.delegate,
                  // ],
                  localeResolutionCallback: (deviceLocal, supportedLocales) {
                    for (var local in supportedLocales) {
                      if (local.languageCode == deviceLocal!.languageCode &&
                          local.countryCode == deviceLocal.countryCode) {
                        return deviceLocal;
                      }
                    }
                    return supportedLocales.first;
                  },
                );
              },
            )),
          );
        });
  }
}

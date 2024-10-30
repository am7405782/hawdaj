import 'package:flutter/material.dart';
import 'package:hawdaj/Localization/localization_constant.dart';
import 'package:hawdaj/constants/keys_values.dart';
import 'package:hawdaj/constants/preference_utility.dart';
import 'package:hawdaj/core/amount.dart';
import 'package:hawdaj/core/app_color.dart';
import 'package:hawdaj/core/app_style.dart';
import 'package:hawdaj/lang_const.dart';
import 'package:hawdaj/main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text(
          getTranslated(context, LangConst.loginNow),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showLanguageModelBottomSheet();
        },
        child: const Icon(Icons.language),
      ),
    );
  }

  showLanguageModelBottomSheet() {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 20,
                      offset: Offset(0, -10),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 100,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black.withOpacity(0.1),
                        )),
                    const SizedBox(height: 24),
                    Text(
                      "Select Language",
                      style: AppStyle.style18W500Black.copyWith(
                        color: Colors.amber,
                      ),
                    ),
                    ListView.builder(
                      itemCount: Language.languageList().length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: Amount.screenMargin,
                        right: Amount.screenMargin,
                      ),
                      itemBuilder: (context, index) {
                        final language = Language.languageList()[index];
                        return ListTile(
                          onTap: () async {
                            print(language.languageCode);
                            Locale local =
                                await setLocale(language.languageCode);
                            setState(() {
                              MyApp.setLocale(context, local);
                              SharedPreferenceUtil.putString(
                                  PrefKey.currentLanguageCode,
                                  language.languageCode);
                              Navigator.of(context).pop();
                            });
                          },
                          contentPadding: EdgeInsets.zero,
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: -4),
                          title: Text(language.name,
                              style: AppStyle.style16W500Black.copyWith(
                                color: Colors.grey,
                              )),
                          trailing: Icon(
                            SharedPreferenceUtil.getString(
                                        PrefKey.currentLanguageCode) ==
                                    language.languageCode
                                ? Icons.check
                                : Icons.check_box_outline_blank,
                            color: AppColor.primary,
                            size: 30,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  Language(
    this.id,
    this.name,
    this.flag,
    this.languageCode,
  );

  static List<Language> languageList() {
    return <Language>[
      Language(1, 'English', '🇺🇸', 'en'),
      Language(2, 'Arabic', '🇦🇪', 'ar'),
      Language(3, 'Russian', '🇷🇺', 'ru'),
      Language(4, 'Chinese', '🇨🇳', 'zh'),
    ];
  }
}

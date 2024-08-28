import 'package:flutter/material.dart';
import 'package:islami_app/Home/homeScreen.dart';
import 'package:islami_app/Home/quran_tap.dart';
import 'package:islami_app/Home/sebha_tap.dart';
import 'package:islami_app/Splash_screen.dart';
import 'package:islami_app/suraDetails_screen.dart';
import 'package:provider/provider.dart';
import 'Providers/app_config_provider.dart';
import 'hadethdetails.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';



// just test 😂😂
void main() {
  runApp(ChangeNotifierProvider(
      create: (Context) => appConfigProvider(), child: const MyApplication()));
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
      routes: {
        "quran": (context) => quranTap(),
        "sebha": (context) => sebhaTap(),
        "home": (context) => homeScreen(),
        "sebha": (context) => sebhaTap(),
        "suradetails": (context) => suraDetails(),
        "hadethdetails": (context) => const hadethdetails(),
        "splash": (context) => const splashScreen(),
      },
      theme: ThemeData(),
      themeMode: provider.appTheme,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

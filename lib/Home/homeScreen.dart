import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Home/hadeth_tap.dart';
import 'package:islami_app/Home/quran_tap.dart';
import 'package:islami_app/Home/radio_tap.dart';
import 'package:islami_app/Home/sebha_tap.dart';
import 'package:islami_app/Setting_tap.dart';
import 'package:islami_app/themeData.dart';
import 'package:provider/provider.dart';

import '../Providers/app_config_provider.dart';

class homeScreen extends StatefulWidget {
  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    return Stack(
      children: [
        provider.isDark()
            ? Image.asset(
                "assets/images/dark_bg.png",
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                "assets/images/default_bg.png",
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          //hv
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            backgroundColor: Colors.transparent,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: provider.isDark()
                  ? themeData.primaryBlack
                  : themeData.primarylight,
            ),
            child: BottomNavigationBar(
              selectedItemColor:
                  provider.isDark() ? themeData.yellow : themeData.blackColor,
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                  label: AppLocalizations.of(context)!.quran,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                  label: AppLocalizations.of(context)!.hadeth,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                  label: AppLocalizations.of(context)!.sebha,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                  label: AppLocalizations.of(context)!.radio,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings,
                ),
              ],
            ),
          ),
          body: taps[selectedIndex],
        )
      ],
    );
  }

  List<Widget> taps = [
    quranTap(),
    hadethTap(),
    sebhaTap(),
    radioTap(),
    settingTap()
  ];

}

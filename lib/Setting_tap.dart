import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/languageButtomSheet.dart';
import 'package:islami_app/theme_buttomSheet.dart';
import 'package:provider/provider.dart';

import 'Providers/app_config_provider.dart';

class settingTap extends StatefulWidget {
  const settingTap({super.key});

  @override
  State<settingTap> createState() => _settingTapState();
}

class _settingTapState extends State<settingTap> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);

    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(AppLocalizations.of(context)!.language,
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    _modalBottomSheetMenu();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffB7935F),
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.appLanguage == "en"
                              ? AppLocalizations.of(context)!.english
                              : AppLocalizations.of(context)!.arabic,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(AppLocalizations.of(context)!.theme,
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    ThemeBottomSheetMenu();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffB7935F),
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.isDark()
                              ? AppLocalizations.of(context)!.dark
                              : AppLocalizations.of(context)!.light,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context, builder: (context) => languageButtomSheet());
  }

  void ThemeBottomSheetMenu() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeButtomSheet());
  }
}

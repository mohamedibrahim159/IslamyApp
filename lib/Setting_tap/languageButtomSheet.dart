import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../Providers/app_config_provider.dart';

class languageButtomSheet extends StatefulWidget {
  const languageButtomSheet({super.key});

  @override
  State<languageButtomSheet> createState() => _languageButtomSheetState();
}

class _languageButtomSheetState extends State<languageButtomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);

    return Container(
      height: 350.0,
      color: Colors.transparent, //could change this to Color(0xFF737373),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0))),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    provider.changeLanguage("en");
                  },
                  child: provider.appLanguage == "en"
                      ? selecteditemWidget(
                          AppLocalizations.of(context)!.english,
                        )
                      : unselecteditemWidget(
                          AppLocalizations.of(context)!.english),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () {
                      provider.changeLanguage("ar");
                    },
                    child: provider.appLanguage == "ar"
                        ? selecteditemWidget(
                            AppLocalizations.of(context)!.arabic,
                          )
                        : unselecteditemWidget(
                            AppLocalizations.of(context)!.arabic)),
              ],
            ),
          )),
    );
  }

  Widget selecteditemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Color(0xffB7935F), fontWeight: FontWeight.bold)),
        Icon(
          Icons.check,
          size: 30,
          color: Color(0xffB7935F),
        )
      ],
    );
  }

  Widget unselecteditemWidget(String text) {
    return Text(
      text,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeButtomSheet extends StatefulWidget {
  const ThemeButtomSheet({super.key});

  @override
  State<ThemeButtomSheet> createState() => _ThemButtomSheetState();
}

class _ThemButtomSheetState extends State<ThemeButtomSheet> {
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
                    provider.changeTheme(ThemeMode.dark);
                  },
                  child: provider.isDark()
                      ? selecteditemWidget(
                          AppLocalizations.of(context)!.dark,
                        )
                      : unselecteditemWidget(
                          AppLocalizations.of(context)!.dark),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () {
                      provider.changeTheme(ThemeMode.light);
                    },
                    child: provider.isDark()
                        ? unselecteditemWidget(
                            AppLocalizations.of(context)!.light,
                          )
                        : selecteditemWidget(
                            AppLocalizations.of(context)!.light)),
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

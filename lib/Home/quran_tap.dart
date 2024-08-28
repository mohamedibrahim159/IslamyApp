import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:islami_app/themeData.dart';
import 'package:provider/provider.dart';

class quranTap extends StatelessWidget {
  quranTap({super.key});

  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);

    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            child: Image(
                image: AssetImage("assets/images/qur2an_screen_logo.png"))),
        Divider(
          thickness: 3,
          color: provider.isDark() ? themeData.yellow : themeData.primarylight,
        ),
        Text(AppLocalizations.of(context)!.sura_name,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25,
            )),
        Divider(
          thickness: 3,
          color: provider.isDark() ? themeData.yellow : themeData.primarylight,
        ),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("suradetails",
                          arguments: suraDetailsArgs(
                              index: index, name: suraNames[index]));
                    },
                    child: Text(
                      suraNames[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                      endIndent: 40,
                      indent: 40,
                      color: provider.isDark()
                          ? themeData.yellow
                          : themeData.primarylight,
                    ),
                itemCount: suraNames.length))
      ],
    );
  }
}

class suraDetailsArgs {
  String name;
  int index;

  suraDetailsArgs({
    required this.index,
    required this.name,
  });
}

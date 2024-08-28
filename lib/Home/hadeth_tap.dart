import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class hadethTap extends StatefulWidget {
  hadethTap({super.key});

  @override
  State<hadethTap> createState() => _hadethTapState();
}

class _hadethTapState extends State<hadethTap> {
  List<hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);

    if (ahadeth.isEmpty) {
      loadFile();
    }
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            child: Image(image: AssetImage("assets/images/hadeth_logo.png"))),
        Divider(
          thickness: 3,
          color: Color(0xffB7935F),
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Divider(
            thickness: 3,
            color: provider.isDark() ? Color(0xffFACC1D) : Color(0xffB7935F)),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Builder(builder: (context) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "hadethdetails",
                            arguments: ahadeth[index]);
                      },
                      child: Text(
                        ahadeth[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                        ),
                      ),
                    );
                  });
                },
                separatorBuilder: (context, index) => Divider(
                    endIndent: 40,
                    indent: 40,
                    color: provider.isDark()
                        ? Color(0xffFACC1D)
                        : Color(0xffB7935F)),
                itemCount: ahadeth.length))
      ],
    );
  }

  void loadFile() async {
    String hadethcontent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadethlist = hadethcontent.split("#\r\n");
    for (int i = 0; i < hadethlist.length; i++) {
      List<String> hadethlines = hadethlist[i].split("\n");
      String title = hadethlines[0];
      hadethlines.removeAt(0);
      hadeth Hadeth = hadeth(content: hadethlines, title: title);
      ahadeth.add(Hadeth);
      setState(() {});
    }
  }
}

class hadeth {
  String title;
  List<String> content;

  hadeth({required this.content, required this.title});
}

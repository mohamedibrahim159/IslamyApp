import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Home/quran_tap.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class suraDetails extends StatefulWidget {
  suraDetails({super.key});

  @override
  State<suraDetails> createState() => _suraDetailsState();
}

class _suraDetailsState extends State<suraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    var args = ModalRoute.of(context)!.settings.arguments as suraDetailsArgs;
    loadFiles(args.index);
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
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "${args.name}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              backgroundColor: Colors.transparent,
            ),
            body: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 75,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: provider.isDark()
                      ? Color(0xffFACC1D)
                      : Color(0xffB7935F)),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text("${verses[index]}");
                },
                itemCount: verses.length,
              ),
            ))
      ],
    );
  }

  void loadFiles(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split("/n");
    verses = lines;
    setState(() {});
  }
}

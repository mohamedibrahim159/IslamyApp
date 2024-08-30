import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:islami_app/Quran_tap/quran_tap.dart';
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
              iconTheme: IconThemeData(
                  color: provider.isDark() ? Colors.white : Colors.black),
              centerTitle: true,
              title: Text("${args.name}",
                  style: TextStyle(fontSize: 35, fontFamily: 'El Messiri')),
              backgroundColor: Colors.transparent,
            ),
            body: Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
                vertical: MediaQuery.of(context).size.height * 0.07,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: provider.isDark() ? Color(0xff141A2E) : Colors.white,
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    "${verses[index]}",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'El Messiri',
                      color:
                          provider.isDark() ? Color(0xffB7935F) : Colors.black,
                    ),
                  );
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

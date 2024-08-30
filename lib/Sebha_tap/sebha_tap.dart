import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/app_config_provider.dart';

class sebhaTap extends StatefulWidget {
  sebhaTap({super.key});

  @override
  State<sebhaTap> createState() => _sebhaTapState();
}

class _sebhaTapState extends State<sebhaTap> {
  int counter = 0;
  double angle = 0;
  int index = 0;

  List<String> Tasbehlist = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);

    return Container(
        child: Column(
      children: [
        Center(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: Transform.rotate(
                    angle: angle,
                    child: provider.isDark()
                        ? Image.asset("assets/images/body_sebha_dark.png")
                        : Image.asset("assets/images/body_sebha_logo.png")),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 80),
                // استخدام start بدلاً من left
                child: provider.isDark()
                    ? Image.asset("assets/images/head_sebha_dark.png")
                    : Image.asset("assets/images/head_sebha_logo.png"),
              )
            ],
          ),
        ),
        SizedBox(
          height: 45,
        ),
        Text(
          "عدد التسبيحات",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              fontFamily: 'El Messiri'),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: provider.isDark() ? Color(0xffFACC1D) : Color(0xffFB7935F),
              borderRadius: BorderRadius.circular(25)),
          child: Text(
            "$counter",
            style: TextStyle(fontSize: 25),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: provider.isDark() ? Color(0xffFACC1D) : Color(0xffFB7935F),
              borderRadius: BorderRadius.circular(45)),
          child: InkWell(
              onTap: () {
                counter++;
                tasbeh();
                angle += 0.7;
              },
              child: Text(
                "${Tasbehlist[index]}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'El Messiri'),
              )),
        )
      ],
    ));
  }

  void tasbeh() {
    if (counter == 33) {
      index++;
      counter = 0;
    }
    if (index > 2) {
      index = 0;
    }
    setState(() {});
  }
}

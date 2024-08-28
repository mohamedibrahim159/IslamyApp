import 'package:flutter/material.dart';

class sebhaTap extends StatefulWidget {
  sebhaTap({super.key});

  @override
  State<sebhaTap> createState() => _sebhaTapState();
}

class _sebhaTapState extends State<sebhaTap> {
  int counter = 0;
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            children: [
              Container(
                child: Image.asset("assets/images/head_sebha_logo.png"),
              ),
              Container(
                child: Image.asset("assets/images/body_sebha_logo.png"),
              ),
            ],
          )
        ]),
        SizedBox(
          height: 50,
        ),
        Text(
          "عدد التسبيحات",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 70,
          width: 55,
          decoration: BoxDecoration(
              color: Color(0xffB7935F),
              borderRadius: BorderRadius.horizontal(
                  right: Radius.elliptical(25, 25),
                  left: Radius.elliptical(25, 25))),
          child: Center(
              child: Text(
            "$counter",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
          )),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            counterText();
            counter = counter + 1;
            initCount();
            setState(() {});
          },
          child: Container(
            height: 60,
            width: 250,
            decoration: BoxDecoration(
                color: Color(0xffB7935F),
                borderRadius: BorderRadius.horizontal(
                    right: Radius.elliptical(45, 45),
                    left: Radius.elliptical(45, 45))),
            child: Center(
                child: Text(
              // counter==0?
              // "سبحان الله"
              //     :
              text,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            )),
          ),
        )
      ],
    );
  }

  void counterText() {
    if (counter == 0 || counter <= 33) {
      text = "سبحان الله";
    } else if (counter == 34 || counter <= 66) {
      text = "الحمد لله";
    } else if (counter == 67 || counter <= 99) {
      text = "لا إله إلا الله";
    } else if (counter == 99) {
      text = "الله أكبر";
    }
  }

  void initCount() {
    if (counter == 100) {
      counter = 0;
    }
  }
}

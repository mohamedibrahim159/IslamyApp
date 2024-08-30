import 'package:flutter/material.dart';

class radioTap extends StatelessWidget {
  const radioTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Container(
          child: Image.asset("assets/images/radio_image.png"),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          child: Text("إذاعة القرآن الكريم",
              style: Theme.of(context).textTheme.titleLarge),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          child: Image.asset("assets/images/Group 9.png"),
        ),
      ],
    );
  }
}

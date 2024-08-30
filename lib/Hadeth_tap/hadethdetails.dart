import 'package:flutter/material.dart';
import 'package:islami_app/Hadeth_tap/hadeth_tap.dart';
import 'package:islami_app/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class hadethdetails extends StatelessWidget {
  const hadethdetails({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appConfigProvider>(context);
    hadeth model = ModalRoute.of(context)?.settings.arguments as hadeth;
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
              title: Text("${model.title}",
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'El Messiri',
                      color: provider.isDark() ? Colors.white : Colors.black)),
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
                    "${model.content[index]}",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'El Messiri',
                      color:
                          provider.isDark() ? Color(0xffB7935F) : Colors.black,
                    ),
                  );
                },
                itemCount: model.content.length,
              ),
            ))
      ],
    );
  }
}

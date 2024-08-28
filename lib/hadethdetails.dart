import 'package:flutter/material.dart';
import 'package:islami_app/Home/hadeth_tap.dart';
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
              centerTitle: true,
              title: Text(
                "${model.title}",
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
                  return Text("${model.content[index]}");
                },
                itemCount: model.content.length,
              ),
            ))
      ],
    );
  }
}

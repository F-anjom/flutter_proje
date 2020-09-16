import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/MyDrawer.dart';

class DarbarehMaa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR"),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "درباره ی ما",
            textAlign: TextAlign.right,
          ),
          backgroundColor: Color(0xffad3434),
        ),
        drawer: MyDrawer(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20, bottom: 20),
            child: Container(
              width: 343.0,
              height: 735.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19.0),
                color: const Color(0xfff9f9f5),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10,right: 10),
                child: Text(
                  'درباره ما',
                  style: TextStyle(
                    fontFamily: 'B Compset',
                    fontSize: 30,
                    color: const Color(0xff595555),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),)
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/MyDrawer.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(localizationsDelegates: [
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
          title: Text("جستجو",
          textAlign: TextAlign.right,),
          backgroundColor: Color(0xffad3434),
        ),

        drawer: MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
          child: TextField(

            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                hintText: "متن خود را وارد کنید..." ,

            ),
          ),
        ),
      ),
    );
  }
}

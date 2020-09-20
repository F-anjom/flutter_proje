import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/MyDrawer.dart';

class ManabePage extends StatelessWidget {
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
                "غیبت",
                textAlign: TextAlign.right,
              ),
              backgroundColor: Color(0xffad3434),
            ),
            drawer: MyDrawer(),
            body: Container(
              width: double.infinity,
              child: Stack(children: [
                Image.asset(
                  "assets/images/backgrandimage.png",
                  repeat: ImageRepeat.repeat,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            kadr(title: "متن"),
                            kadr(title: "تصویر"),
                            kadr(title: "کلیپ"),
                            kadr(title: "صوتی"),
                            kadr(title: "صوت")
                          ]),
                    ),
                    Expanded(
                      flex: 8,
                      child: GridView.count(
                        crossAxisCount: 1,
                        childAspectRatio: 2.6,
                        children: [
                          ...List.generate(20, (index) => clipkadr()),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            )));
  }

  Widget kadr({String title = ""}) {
    return Container(
      child: Center(
          child: Text(
        title,
        style: TextStyle(color: Color(0xffad3434)),
      )),
      height: 31.0,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xbdffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
    );
  }

  Widget clipkadr() {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 40, top: 10, bottom: 10),
      child: Container(
        width: 67.0,
        height: 31.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xbdffffff),
          boxShadow: [
            BoxShadow(
              color: const Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
              child: Container(
                height: 120,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "عنوان",
                  style: TextStyle(
                    fontFamily: 'B Ferdosi',
                    fontSize: 35,
                    color: const Color(0xff707070),
                  ),
                  textAlign: TextAlign.right,
                ),
                Text("نویسنده",
                  style: TextStyle(
                    fontFamily: 'B Hamid',
                    fontSize: 20,
                    color: const Color(0xff707070),
                  ),
                  textAlign: TextAlign.right,),
                Text("ناشر",
                  style: TextStyle(
                    fontFamily: 'B Hamid',
                    fontSize: 20,
                    color: const Color(0xff707070),
                  ),
                  textAlign: TextAlign.right,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

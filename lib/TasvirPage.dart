import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/MyDrawer.dart';

class TasvirPage extends StatelessWidget {
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
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0,left: 8),
                        child: GridView.count(crossAxisCount: 3,
                          childAspectRatio: 1.2,

                          children: [
                            ...List.generate(20, (index) => tasvir())

                          ], ),
                      ),
                    ),
                  ],
                ),
              ]
              ),
            )
        )
    );
  }

  Widget kadr({String title = ""}) {
    return Container(
      child: Center(child: Text(title,style: TextStyle(color: Color(0xffad3434)),)),
      height: 31.0,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
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

  Widget tasvir() {
    return Padding(
      padding: const EdgeInsets.all(8),
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
      ),
    );
  }
}

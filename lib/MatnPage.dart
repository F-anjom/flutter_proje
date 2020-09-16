import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/MyDrawer.dart';

class MatnPage extends StatelessWidget {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        kadr(
                          title: "متن"
                        ),
                        kadr(
                          title: "تصویر"
                        ),
                        kadr(
                          title: "کلیپ"
                        ),
                        kadr(
                          title: "صدا"
                        ),
                       ]
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.lightGreenAccent,
                    )

                  ],
                ),

//            Center(child: Text(""))
              ]),
            )
        )
    );
  }
  Widget kadr({String title = ""}){
    return Container(
      child: Text(title),
      height: 31.0,
      width: 50,
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
}

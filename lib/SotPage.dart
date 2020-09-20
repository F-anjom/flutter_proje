import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/MyDrawer.dart';

class SotPage extends StatelessWidget {
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
                        childAspectRatio: 3.8,
                        children: [
                          ...List.generate(20, (index) => sotkadr()),
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

  Widget sotkadr() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10,bottom: 18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
          color: const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: const Color(0x29000000),
              offset: Offset(1, 1),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Row(
          children: [
            Text("1."),
            Column(
//              mainAxisAlignment: MainAxisAlignment.,
              children: [
                Text(
                  'سخنرانی',
                  style: TextStyle(
                    fontFamily: 'B Baran',
                    fontSize: 12,
                    color: const Color(0xffad9f9f),
                  ),
                  textAlign: TextAlign.right,
                ),
                Text(
                  'عنوان',
                  style: TextStyle(
                    fontFamily: 'B Ferdosi',
                    fontSize: 35,
                    color: const Color(0xff707070),
                    height: 0.8
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
           Row(
             children: [
               Container(
                 child: Icon(Icons.share, color: Colors.grey,),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(
                       Radius.elliptical(9999.0, 9999.0)),
                   color: const Color(0xffffffff),
                   boxShadow: [
                     BoxShadow(
                       color: const Color(0x29000000),
                       offset: Offset(1, 1),
                       blurRadius: 0,
                     ),
                   ],
                 ),
               ),
               Container(
                 height: 40,
                 width: 40,
                 child: Icon(Icons.play_arrow, color: Colors.white,),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(
                       Radius.elliptical(9999.0, 9999.0)),
                   color: const Color(0xff60b44b),
                   boxShadow: [
                     BoxShadow(
                       color: const Color(0x29000000),
                       offset: Offset(1, 1),
                       blurRadius: 0,
                     ),
                   ],
                 ),)
             ],
           )
          ],
        ),
      ),
    );
  }
}

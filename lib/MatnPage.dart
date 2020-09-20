import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/MyDrawer.dart';
import 'package:flutter_proje/resourses.dart';

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
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Container(
                          height: 100,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              ListView(
                                children: [
                                  ...List.generate(
                                      Res.gonahExample.split("\n").length,
                                      (index) {
                                        return Res.gonahExample.split("\n")[index].contains("#")?
                                      titr(
                                          Res.gonahExample.split("\n")[index].replaceAll("#", "")):
                                  text(
                                    Res.gonahExample.split("\n")[index]
//                                "امانت - هر چه باشد - به معناى چيزى است كه نزد غير وديعه بسپارند، تا او آن را براى سپارنده حفظ كند، و سپس به وى برگرداند، و در آيه مورد بحث امانت عبارت است از چيزى كه خداى تعالى آن را به انسان به وديعه سپرده، تا انسان آن را براى خدا حفظ كند، و سالم و مستقيم نگه بدارد، و سپس به صاحبش يعنى خداى سبحان برگرداند",
                                  );}),

                                ],
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(right: 8.0, left: 8),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.assignment,
                                        color: Colors.grey[600],
                                      ),
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(9999.0, 9999.0)),
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
                                    Container(
                                      child: Icon(
                                        Icons.settings,
                                        color: Colors.grey[600],
                                      ),
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(9999.0, 9999.0)),
                                        color: const Color(0xffffffff),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0x29000000),
                                            offset: Offset(0, 3),
                                            blurRadius: 6,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
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

  titr([title = "تیتر"]) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/images/asset1.png"),
          Center(
              child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ))
        ],
      ),
    );
  }

  text([text = "خالی"]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}

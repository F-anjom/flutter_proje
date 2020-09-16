import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/MyDrawer.dart';

class ErsalSoal extends StatelessWidget {
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
            "ارسال سوال",
            textAlign: TextAlign.right,
          ),
          backgroundColor: Color(0xffad3434),
        ),
        drawer: MyDrawer(),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 60, bottom: 60, left: 30, right: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color(0xfffafae8),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 55, left: 55, top: 85, bottom: 80),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5, top: 6),
                        child: TextField(
                          cursorColor: Colors.grey[500],
                          decoration: InputDecoration.collapsed(
                            hintText: "موضوع سوال",
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color(0x4dffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0x4d707070)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x0c000000),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5, top: 6),
                          child: TextField(
                            cursorColor: Colors.grey[500],
                            decoration: InputDecoration.collapsed(
                              hintText: "متن سوال",
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: const Color(0x4dffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0x4d707070)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x0c000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,right: 30),
                        child: Container(
                          child: Center(child: Text("ارسال")),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0xff17862a),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(2, 2),
                                blurRadius: 2,
                              ),
                            ],
                          ),                          height: 50,
                          width: 80,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20,top: 20),
                        child: Container(
                          child: Center(child: Text("لغو")),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0xfff52e2e),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(2, 2),
                                blurRadius: 2,
                              ),
                            ],
                          ),                          height: 50,
                          width: 80,),
                      )],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

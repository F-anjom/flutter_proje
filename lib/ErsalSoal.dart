import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/FirstPage.dart';
import 'package:flutter_proje/MyDrawer.dart';
import 'package:intent/extra.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:android_intent/android_intent.dart';
import 'package:intent/intent.dart' as android_intent;
import 'package:intent/action.dart' as android_action;

class ErsalSoal extends StatelessWidget {
  var topicController = TextEditingController();
  var textController = TextEditingController();

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
                          controller: topicController,
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
                            controller: textController,
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
                      GestureDetector(
                        onTap: sendMessage,
                        child: Padding(
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
                      ),
                      GestureDetector(
                        onTap: (){Navigator.of(context).pop<FirstPage>();},
                        child: Padding(
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
                        ),
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

  sendMessage() async {
    if(topicController.value.text == "" || textController.value.text == ""){
      print("please fill topic and text");
      return;
    }
    if(Platform.isAndroid){
      const uri = 'sms:30009640?sms_body=hello%20there';
      if (await canLaunch(uri)) {
        await launch(uri);
      }
    }
    else if(Platform.isIOS){
      //FOR IOS
      var url ='sms:30009640&body=message';
      await launch(url);
    }
  }
}

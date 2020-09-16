import 'package:flutter/material.dart';
import 'package:flutter_proje/MyDrawer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FirstPage extends StatelessWidget {
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
            appBar: AppBar(),
            drawer: MyDrawer(),
            body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      "گناهان کبیره",
                      style: TextStyle(fontSize: 50, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 1.3,
                        children: List.generate(
                            gonahan.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10,
                                      top: 14,
                                      bottom: 14),
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        gonahan[index],
                                      ),
                                    ),
                                    width: 50,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11),
                                        gradient: RadialGradient(
                                          center: Alignment(0.0, 0.0),
                                          radius: 0.5,
                                          colors: [
                                            const Color(0xffe8dede),
                                            const Color(0xffe9d0d0),
                                            const Color(0xffebcc85)
                                          ],
                                        )),
                                  ),
                                )),
                      ),
                    ))
              ],
            )));
  }

  var gonahan = ["دوغ", "غیبت", "ظلم", "قتل", "", "", "", "", "", "تهمت"];
}
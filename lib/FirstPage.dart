import 'package:flutter/material.dart';
import 'package:flutter_proje/ClipPage.dart';
import 'package:flutter_proje/MyDrawer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/SecondPage.dart';
import 'package:flutter_proje/TasvirPage.dart';
import 'package:flutter_proje/db.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Future titles;

  @override
  void initState() {
    DB.instance.initCopyData();
    titles = Gonah.titlesAndIds();
    super.initState();
  }

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
            backgroundColor: Color(0xFFFAFAFa),
//            backgroundColor: Colors.redAccent.withAlpha(211),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              iconTheme: IconThemeData(color: Colors.red),
              toolbarHeight: 44,
              leading: Builder(builder: (context) {
                return IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 44,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              }),
            ),
            drawer: MyDrawer(),
            body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "گناهان کبیره",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.red,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(blurRadius: 5, color: Colors.black38,offset: Offset(0,2))
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: FutureBuilder(
                        future: titles,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return CircularProgressIndicator();
                          var items =
                              (snapshot.data as List<Map<String, dynamic>>);
                          return Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 1.3,
                              children: List.generate(
                                  items.length,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => SecondPage(
                                                  items[index]["id"]),
                                            ),
                                          );
                                        },
                                        child: Card(
                                          margin: EdgeInsets.all(8),
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            child: Center(
                                              child: Text(
                                                items[index]['title'],
                                                style: TextStyle(
                                                    fontFamily: "Entezar",
//                                            fontWeight: FontWeight.bold,
                                                    color: Colors.red.withOpacity(0.7),
                                                    fontSize: 22 +
                                                        (20 /
                                                            items[index]
                                                                    ['title']
                                                                .toString()
                                                                .length
                                                                .toDouble()),
                                                    height: 1.3,
                                                    wordSpacing: 2,
                                                    letterSpacing: 2.4,
                                                    shadows: [
                                                      Shadow(
                                                          blurRadius: 1,
                                                          color: Colors.brown,
                                                          offset: Offset(0, 1))
                                                    ]),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            width: 50,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/moqava.jpg"),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                      )),
                            ),
                          );
                        }))
              ],
            )));
  }
}

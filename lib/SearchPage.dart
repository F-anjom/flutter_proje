import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/MyDrawer.dart';
import 'package:flutter_proje/SecondPage.dart';
import 'package:flutter_proje/db.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var textInputController = TextEditingController();

  List<Map<String, dynamic>> gs = [];

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
            "جستجو",
            textAlign: TextAlign.right,
          ),
          backgroundColor: Color(0xffad3434),
        ),
        drawer: MyDrawer(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: TextField(
                controller: textInputController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  hintText: "متن خود را وارد کنید...",
                ),
                onChanged: onChanged,
              ),
            ),
            gs.isEmpty
                ? Text("موردی یافت نشده است")
                : Expanded(
                    child: ListView(
                      children: [
                        ...List.generate(
                            gs.length,
                            (index) => GestureDetector(
                              onTap: (){
                                Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SecondPage(gs[index]['id']),
                                          ),
                                        );
                              },
                              child: Container(
                                margin: EdgeInsets.all(7),
                                padding: EdgeInsets.all(7),
                                width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [BoxShadow()]
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      var contact = gs[index]['text'].toString();
                                      var idxOfSearched = contact.indexOf(RegExp('${textInputController.value.text}'));
                                      var last = contact.length - idxOfSearched > 22? idxOfSearched + 22 : contact.length;
                                      contact = contact.substring(idxOfSearched, last  );
                                      contact += " ...";
                                      return Row(
                                        children: [
                                          Text(gs[index]['title'].toString()),
                                          Text("|   "),
                                          Text(contact)
                                        ],
                                      );
                                    }
                                  )),
                            ))
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Future<void> onChanged(String value) async {
    var gons = await Gonah.search(search: textInputController.value.text);
    setState(() {
      gs = gons;
    });
  }
}

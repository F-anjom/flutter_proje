import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proje/DarbarehMaa.dart';
import 'package:flutter_proje/ErsalSoal.dart';
import 'package:flutter_proje/FirstPage.dart';
import 'package:flutter_proje/SearchPage.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.0, -1.0),
                end: Alignment(1.0, 1.0),
                colors: [
                  const Color(0xfff1e3eb),
                  const Color(0xfff3b1b1),
                  const Color(0xffe78180)
                ],
                stops: [0.0, 0.4, 1.0],
              ),

            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text("شناخت گناهان کبیره و راه های علاج آن\nراهی برای نزدیکتر شدن به خدا",
                style: TextStyle(
                  fontFamily: 'B Nazanin',
                  fontSize: 17,
                  color: const Color(0xffad3434),
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    )
                  ],
                ),
                textAlign: TextAlign.right,),
            ),
          ),
          item("گناهان", Icons.assignment, (){open(FirstPage());}),
          item("جستجو", Icons.search, (){open(SearchPage());}),
          item("ارسال سوال", Icons.present_to_all, (){open(ErsalSoal());}),
          item("درباره ما", Icons.description, (){ open(DarbarehMaa());}),
          item("خروج", Icons.exit_to_app, (){Navigator.of(context).pop();exit(0);}),

        ],
      ),
    );
  }

  Widget item([String s = "title", IconData icon = Icons.map, onTap]) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon,size: 27,color: Color(0xffad3434),textDirection:TextDirection.rtl),
      title: Text(s,
        style: TextStyle(
          fontFamily: 'B Baran',
          fontSize: 20,
          color: const Color(0xffad3434),
          shadows: [
            Shadow(
              color: const Color(0x29000000),
              offset: Offset(1, 1),
            )
          ],
        ),
        textAlign: TextAlign.start,
      ),
    );
  }

  void open(firstPage) {
    Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => firstPage,
              ),
            );
  }

}

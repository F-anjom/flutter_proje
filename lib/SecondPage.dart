import 'package:flutter/material.dart';
import 'package:flutter_proje/AlajPage.dart';
import 'package:flutter_proje/ClipPage.dart';
import 'package:flutter_proje/ManabePage.dart';
import 'package:flutter_proje/MatnPage.dart';
import 'package:flutter_proje/MyDrawer.dart';
import 'package:flutter_proje/SotPage.dart';
import 'package:flutter_proje/TasvirPage.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var index = 0;
  var pages = [
    MatnPage(),
    TasvirPage(),
    ClipPage(),
    SotPage(),
    AlajPage(),
    ManabePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Container(
                  height: 50,
                  child: ListView(
                      shrinkWrap: true,
//                    padding: EdgeInsets.all(22),
                    scrollDirection: Axis.horizontal,
                      children: [
                        kadr(0, title: "متن"),
                        kadr(1,title: "تصویر"),
                        kadr(2,title: "کلیپ"),
                        kadr(3, title: "صوتی"),
                        kadr(4, title: "علاج"),
                        kadr(5, title: "منابع"),
                      ]),
                ),
                Expanded(
                  child: pages[index]
                ),
              ],
            ),
          ]
          ),
        )
    );
  }


  Widget kadr(id, {String title = ""}) {
    return GestureDetector(
      onTap: (){
        setState(() {
          index = id;
        });
      },
      child: Align(
        child: Container(
          margin: EdgeInsets.all(6),
          child: Center(child: Text(title,style: TextStyle(color: Color(0xffad3434)),)),
          height: 35.0,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: index == id? const Color(0xf1ff9875) :  const Color(0xfaffffff),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

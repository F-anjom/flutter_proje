import 'package:flutter/material.dart';
import 'package:flutter_proje/MatnPage.dart';
import 'package:flutter_proje/MyDrawer.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
                  child: MatnPage()
                ),
              ],
            ),
          ]
          ),
        )
    );
  }


  Widget kadr({String title = ""}) {
    return Container(
      child: Center(child: Text(title,style: TextStyle(color: Color(0xffad3434)),)),
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
}

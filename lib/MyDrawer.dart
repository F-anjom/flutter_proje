import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget MyDrawer(){
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0, 0.08),
              end: Alignment(1.0, 0.09),
              colors: [
                const Color(0xfffff3eb),
                const Color(0xfff3b1b1),
                const Color(0xffe76180)
              ],
              stops: [0.0, 0.539, 1.0],
            ),

          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text("،شناخت گناهان کبیره و راه های علاج آن\nراهی برای نزدیکتر شدن به خدا",
              style: TextStyle(
                fontFamily: 'B Nazanin',
                fontSize: 18,
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
        ListTile(
          leading: Icon(Icons.assignment,size: 27,color: Color(0xffad3434),textDirection:TextDirection.rtl),
          title: Text("لیست موارد",
            style: TextStyle(
              fontFamily: 'B Baran',
              fontSize: 27,
              color: const Color(0xffad3434),
              shadows: [
                Shadow(
                  color: const Color(0x29000000),
                  offset: Offset(1, 1),
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ListTile(


          leading: Icon(Icons.search,size: 27,color: Color(0xffad3434),textDirection:TextDirection.rtl ,),
          title: Text("جستجو",
            style: TextStyle(
              fontFamily: 'B Baran',
              fontSize: 27,
              color: const Color(0xffad3434),
              shadows: [
                Shadow(
                  color: const Color(0x29000000),
                  offset: Offset(1, 1),
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ListTile(
          leading: Icon(Icons.present_to_all,size: 27,color: Color(0xffad3434),textDirection:TextDirection.rtl),
          title: Text("ارسال سوال",
            style: TextStyle(
              fontFamily: 'B Baran',
              fontSize: 27,
              color: const Color(0xffad3434),
              shadows: [
                Shadow(
                  color: const Color(0x29000000),
                  offset: Offset(1, 1),
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ListTile(
          leading: Icon(Icons.description,size: 27,color: Color(0xffad3434),textDirection:TextDirection.rtl),
          title: Text("درباره ی ما",
            style: TextStyle(
              fontFamily: 'B Baran',
              fontSize: 27,
              color: const Color(0xffad3434),
              shadows: [
                Shadow(
                  color: const Color(0x29000000),
                  offset: Offset(1, 1),
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app,size: 27,color: Color(0xffad3434),textDirection:TextDirection.rtl),
          title: Text("خروج",
            style: TextStyle(
              fontFamily: 'B Baran',
              fontSize: 27,
              color: const Color(0xffad3434),
              shadows: [
                Shadow(
                  color: const Color(0x29000000),
                  offset: Offset(1, 1),
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
        )


      ],
    ),
  );
}

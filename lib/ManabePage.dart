import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/MyDrawer.dart';

class ManabePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      childAspectRatio: 2.6,
      children: [
        ...List.generate(20, (index) => clipkadr()),
      ],
    );
  }

  Widget clipkadr() {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 40, top: 10, bottom: 10),
      child: Container(
        width: 67.0,
        height: 31.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xbdffffff),
          boxShadow: [
            BoxShadow(
              color: const Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
              child: Container(
                height: 120,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
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
            ),
            Column(
              children: [
                Text(
                  "عنوان",
                  style: TextStyle(
                    fontFamily: 'B Ferdosi',
                    fontSize: 35,
                    color: const Color(0xff707070),
                  ),
                  textAlign: TextAlign.right,
                ),
                Text("نویسنده",
                  style: TextStyle(
                    fontFamily: 'B Hamid',
                    fontSize: 20,
                    color: const Color(0xff707070),
                  ),
                  textAlign: TextAlign.right,),
                Text("ناشر",
                  style: TextStyle(
                    fontFamily: 'B Hamid',
                    fontSize: 20,
                    color: const Color(0xff707070),
                  ),
                  textAlign: TextAlign.right,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

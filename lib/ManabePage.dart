import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proje/db.dart';


class ManabePage extends StatefulWidget {
  final Gonah gonah;
  ManabePage(this.gonah);

  @override
  _ManabePageState createState() => _ManabePageState();
}

class _ManabePageState extends State<ManabePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var items = json.decode(utf8.decode(utf8.encode(widget.gonah.resources)));
    return GridView.count(
      crossAxisCount: 1,
      childAspectRatio: 2.6,
      children: [
        ...List.generate(items.length, (index) => clipkadr(items[index])),
      ],
    );
  }

  Widget clipkadr(item) {
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
                child: Image.network(
                  "http://shahidchegini.ir/app_kabireh/manabeImgs/${item['img_url']}".replaceAll('mp4', 'png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: TextStyle(
                      fontFamily: 'B Ferdosi',
                      fontSize: 22,
                      color: Colors.black// const Color(0xff707070),
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Row(
                    children: [
                      Text(
                        "نویسنده: ",
                        style: TextStyle(
                          fontFamily: 'B Hamid',
                          fontSize: 14,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.right,),
                      Text(
                        item['author'],
                        style: TextStyle(
                          fontFamily: 'B Hamid',
                          fontSize: 14,
                          color: const Color(0xff202020),
                        ),
                        textAlign: TextAlign.right,),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "ناشر: ",
                        style: TextStyle(
                          fontFamily: 'B Hamid',
                          fontSize: 14,
                          color: const Color(0xff707070),
                        ),
                        textAlign: TextAlign.right,),
                      Text(
                        item['publisher'],
                        style: TextStyle(
                          fontFamily: 'B Hamid',
                          fontSize: 14,
                          color: const Color(0xff202020),
                        ),
                        textAlign: TextAlign.right,),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


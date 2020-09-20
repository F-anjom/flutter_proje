import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/MyDrawer.dart';
import 'package:flutter_proje/resourses.dart';

class TasvirPage extends StatefulWidget {
  @override
  _TasvirPageState createState() => _TasvirPageState();
}

class _TasvirPageState extends State<TasvirPage> {
  int gonahId = 1;
  Future images;
  @override
  void initState() {
    images = Res.fetchGonahImageUrls(gonahId);
    super.initState();
  }
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
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8),
                    child: FutureBuilder(
                      future: images,
                      builder: (context, snapshot) {
                        print(snapshot.data);
                        return GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: 1.2,
                          children: [...List.generate(snapshot.data.length, (index) => tasvir(snapshot.data[index]))],
                        );
                      }
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ));;
  }

  Widget kadr({String title = ""}) {
    return Container(
      child: Center(
          child: Text(
            title,
            style: TextStyle(color: Color(0xffad3434)),
          )),
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

  Widget tasvir(name) {
    return Padding(
      padding: const EdgeInsets.all(8),
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
          child: Image.network("http://shahidchegini.ir/app_kabireh/imgs/$gonahId/$name", fit: BoxFit.cover,),
      ),
    );
  }

}

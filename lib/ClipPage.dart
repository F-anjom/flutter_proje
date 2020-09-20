import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/MyDrawer.dart';
import 'package:flutter_proje/VideoShowPage.dart';
import 'package:flutter_proje/resourses.dart';

class ClipPage extends StatefulWidget {
  @override
  _ClipPageState createState() => _ClipPageState();
}

class _ClipPageState extends State<ClipPage> {
  int gonahId = 1;
  var items;

  @override
  void initState() {
    items = Res.fetchGonahVideoUrls(gonahId);
    // TODO: implement initState
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
                  child: FutureBuilder(
                      future: items,
                      builder: (context, snapshot) {
//                      print((snapshot.data[0] as String).replaceAll('mp4', 'png'));
                        return GridView.count(
                          crossAxisCount: 1,
                          childAspectRatio: 2.6,
                          children: [
                            ...List.generate(
                                snapshot.data.length,
                                (index) => clipkadr(
                                    (snapshot.data[index] as String)
                                        )),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ]),
        ));
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
        borderRadius: BorderRadius.circular(8),
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

  Widget clipkadr(String name) {
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
            GestureDetector(
              onTap: (){
                Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoShowPage("http://shahidchegini.ir/app_kabireh/videos/$gonahId/$name"),
                          ),
                        );
              },
              child: Padding(
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
                    "http://shahidchegini.ir/app_kabireh/videos/$gonahId/$name".replaceAll('mp4', 'png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                    width: 160,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                    )),
                Text("عنوان"),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.share,
                          color: Colors.grey[600],
                        ),
                        Icon(
                          Icons.file_download,
                          color: Colors.grey[600],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

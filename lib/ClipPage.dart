import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/MyDrawer.dart';
import 'package:flutter_proje/VideoShowPage.dart';
import 'package:flutter_proje/db.dart';
import 'package:flutter_proje/resourses.dart';

class ClipPage extends StatefulWidget {
  final Gonah gonah;
  ClipPage(this.gonah);

  @override
  _ClipPageState createState() => _ClipPageState();
}

class _ClipPageState extends State<ClipPage> {
  int gonahId = 1;
  var items;

  @override
  void initState() {
    gonahId = widget.gonah.id;
    items = Res.fetchGonahVideoUrls(gonahId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: items,
        builder: (context, snapshot) {
          if(!snapshot.hasData) return Center(child: CircularProgressIndicator());
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
        });
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 160,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      name.substring(0, name.indexOf(".")),
                      overflow: TextOverflow.ellipsis,
                    )),
//                Text("عنوان"),
//                Padding(
//                  padding: const EdgeInsets.only(right: 50),
//                  child: Container(
//                    height: 30,
//                    width: 80,
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(9.0),
//                      color: const Color(0xbdffffff),
//                      boxShadow: [
//                        BoxShadow(
//                          color: const Color(0x29000000),
//                          offset: Offset(0, 3),
//                          blurRadius: 6,
//                        ),
//                      ],
//                    ),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: [
//                        Icon(
//                          Icons.share,
//                          color: Colors.grey[600],
//                        ),
//                        Icon(
//                          Icons.file_download,
//                          color: Colors.grey[600],
//                        )
//                      ],
//                    ),
//                  ),
//                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proje/AlajPage.dart';
import 'package:flutter_proje/ClipPage.dart';
import 'package:flutter_proje/ManabePage.dart';
import 'package:flutter_proje/MatnPage.dart';
import 'package:flutter_proje/MyDrawer.dart';
import 'package:flutter_proje/SotPage.dart';
import 'package:flutter_proje/TasvirPage.dart';
import 'package:flutter_proje/db.dart';

class SecondPage extends StatefulWidget {
  final int gonahId;

  SecondPage(this.gonahId);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var index = 0;
//  List<Widget> pages;
  @override
  void initState() {

    super.initState();
    connectedState();
  }

  Future<void> lol () async {
    var d  = await Gonah.byId(widget.gonahId).then((value) => Gonah.fromJson(value.first));

    return [
      MatnPage(d),
      TasvirPage(d),
      ClipPage(d),
      SotPage(d),
      AlajPage(d),
      ManabePage(d)
    ];
  }

  Future<bool> connectedState() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
    // return con != ConnectivityResult.none;
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
                  child: FutureBuilder(
                    future: connectedState(),
                    builder: (context, snapshotConnected) {
                      if(snapshotConnected.hasData &&
                          snapshotConnected.data == false &&
                          index > 0 && index < 4
                      )
                        return checkInternet();
                      return FutureBuilder(
                        future: lol(),
                        builder: (context, snapshot) {
                          if(!snapshot.hasData)return Center(child: CircularProgressIndicator());
                          return snapshot.data[index];
                        }
                      );
                    }
                  )
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

  Widget checkInternet() {
    return Center(child: Material(
      elevation: 8,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 12,),
                Text("اینترنت چک شود")
              ],
            ),
            SizedBox(width: 64,),
            Icon(Icons.signal_cellular_connected_no_internet_4_bar, size: 30, color: Colors.red,)
          ],
        ),
      ),
    ),);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_proje/db.dart';
import 'package:flutter_proje/resourses.dart';

class MatnPage extends StatefulWidget {
  final Gonah gonah;
  MatnPage(this.gonah);

  @override
  _MatnPageState createState() => _MatnPageState();
}

class _MatnPageState extends State<MatnPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Container(
            height: 100,
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ListView(
                  children: [
                    ...List.generate(
                        widget.gonah.text.split("\n").length,
                            (index) {
                          return widget.gonah.text.split("\n")[index].contains("#")?
                          titr(
                              widget.gonah.text.split("\n")[index].replaceAll("#", "")):
                          text(
                              widget.gonah.text.split("\n")[index]
//                                "امانت - هر چه باشد - به معناى چيزى است كه نزد غير وديعه بسپارند، تا او آن را براى سپارنده حفظ كند، و سپس به وى برگرداند، و در آيه مورد بحث امانت عبارت است از چيزى كه خداى تعالى آن را به انسان به وديعه سپرده، تا انسان آن را براى خدا حفظ كند، و سالم و مستقيم نگه بدارد، و سپس به صاحبش يعنى خداى سبحان برگرداند",
                          );}),

                  ],
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(right: 8.0, left: 8),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Icon(
                          Icons.assignment,
                          color: Colors.grey[600],
                        ),
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
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
                      Container(
                        child: Icon(
                          Icons.settings,
                          color: Colors.grey[600],
                        ),
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      }
    );
  }

  titr([title = "تیتر"]) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/images/asset1.png"),
          Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ))
        ],
      ),
    );
  }

  text([text = "خالی"]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}


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
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8),
      child: FutureBuilder(
          future: images,
          builder: (context, snapshot) {
            if(!snapshot.hasData) return Center(child: CircularProgressIndicator());
            print(snapshot.data);
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.2,
              children: [
                ...List.generate(snapshot.data.length,
                    (index) => tasvir(snapshot.data, index))
              ],
            );
          }),
    );
  }

  Widget tasvir(data, index) {
    var name = data[index];
    return GestureDetector(
      onTap: () {
        tap(data, index);
      },
      child: Padding(
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
          child: Image.network(
            Uri.encodeFull(
                "http://shahidchegini.ir/app_kabireh/imgs/$gonahId/$name"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void tap(data, index) {
    showDialog(
        context: context,
        builder: (ctx) {
          var newIndex = index;
          return Alertt(index, data, gonahId);
        });
  }
}

class Alertt extends StatefulWidget {
  var index;
  var data;
  var gonahId;
  Alertt(this.index, this.data, this.gonahId);
  @override
  _AlerttState createState() => _AlerttState();
}

class _AlerttState extends State<Alertt> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          Uri.encodeFull(
              "http://shahidchegini.ir/app_kabireh/imgs/${widget.gonahId}/${widget.data[widget.index]}"),
        ),
        GestureDetector(
            onTap: (){
              setState(() {
                if(widget.index >= widget.data.length-1)return;
                widget.index = widget.index+1;
              });
            },
            child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.navigate_next,
                  size: 44,
                  color: Colors.blue,
                ))),
        GestureDetector(
          onTap: (){
            setState(() {
              if(widget.index <= 0)return;
              widget.index = widget.index-1;
            });
          },
          child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.navigate_before,
                size: 44,
                color: Colors.blue,
              )),
        ),
      ],
    );
  }
}


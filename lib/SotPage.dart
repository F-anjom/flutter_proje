import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proje/db.dart';
import 'package:flutter_proje/resourses.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class SotPage extends StatefulWidget {
  final Gonah gonah;

  SotPage(this.gonah);

  @override
  _SotPageState createState() => _SotPageState();
}

class _SotPageState extends State<SotPage> {
  Future audios;

  @override
  void initState() {
    audios = Res.fetchGonahAudioUrls(widget.gonah.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: audios,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          var items = snapshot.data;
          return GridView.count(
            crossAxisCount: 1,
            childAspectRatio: 4.9,
            children: [
              ...List.generate(items.length, (index) => sotkadr(index, items)),
            ],
          );
        });
  }

  var indexPlaying = -1;

  Widget sotkadr(int index, List<dynamic> items) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
          color: indexPlaying == index &&
                  Provider.of<PlayerNotif>(context, listen: false).playing
              ? const Color(0xffDFFFDF)
              : const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: const Color(0x29000000),
              offset: Offset(1, 1),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  Text((index + 1).toString() + "."),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index].toString().replaceAll('.mp3', ''),
                        style: TextStyle(
                            fontFamily: 'B Ferdosi',
                            fontSize: 16,
                            color: const Color(0xff707070),
                            height: 0.8),
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.clip,
                      ),
                      Text(
                        'سخنرانی',
                        style: TextStyle(
                          fontFamily: 'B Baran',
                          fontSize: 12,
                          color: const Color(0xffad9f9f),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.share,
                      color: Colors.grey,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: const Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(1, 1),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        onPlayTap(index, items);
                      },
                      child: playButton(indexPlaying == index &&
                          Provider.of<PlayerNotif>(context).playing))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onPlayTap(index, items) async {
    var p = Provider.of<PlayerNotif>(context, listen: false);
    bool currentPlaying = indexPlaying == index && p.playing;
    if (currentPlaying) {
      p.pause();
      return;
    }

    var duration = await p.player
        .setUrl('http://shahidchegini.ir/app_kabireh/audios/1/${items[index]}');
    duration = duration;
    p.play();
    p.setTitle(items[index].toString().replaceAll(".mp3", ""));

    showBottomSheet(
        context: context,
        builder: (ctx) {
          return ListenableProvider.value(
              value: p, child: MusicBottomSheet());
        });

    setState(() {
      indexPlaying = index;
    });
    return;
  }
}

class MusicBottomSheet extends StatefulWidget {
  @override
  _MusicBottomSheetState createState() => _MusicBottomSheetState();
}

class _MusicBottomSheetState extends State<MusicBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var p = Provider.of<PlayerNotif>(context, listen: false);
    return Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(color: Colors.greenAccent,
//          borderRadius: BorderRadius.only(topLeft: Radius.circular(44), topRight: Radius.circular(22))
            boxShadow: [
              BoxShadow(spreadRadius: 1, blurRadius: 6, color: Colors.grey)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Provider.of<PlayerNotif>(context).title.toString()),
            GestureDetector(
                onTap: () {
                  if (p.playing)
                    p.pause();
                  else {
                    p.play();
                  }
                },
                child: playButton(p.playing)),
          ],
        ));
  }
}

playButton(bool playing) {
  return Container(
    height: 40,
    width: 40,
    child: Icon(
      playing ? Icons.pause : Icons.play_arrow,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
      color: const Color(0xff60b44b),
      boxShadow: [
        BoxShadow(
          color: const Color(0x29000000),
          offset: Offset(1, 1),
          blurRadius: 0,
        ),
      ],
    ),
  );
}

class PlayerNotif extends ChangeNotifier {
  var player = AudioPlayer();
  String title = "";

  bool get playing {
    return player.playing;
  }

  setTitle(String str) {
    title = str;
    notifyListeners();
  }

  play() {
    player.play();
    notifyListeners();
  }

  pause() {
    player.pause();
    notifyListeners();
  }

  setUrl(url) {
    player.setUrl(url);
    notifyListeners();
  }

  stop(){
    player.stop();
    notifyListeners();
  }
}

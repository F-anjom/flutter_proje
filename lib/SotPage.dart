import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/MyDrawer.dart';
import 'package:flutter_proje/db.dart';
import 'package:flutter_proje/resourses.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class SotPage extends StatefulWidget {
  final Gonah gonah;
  static final assetsAudioPlayer = AssetsAudioPlayer();

  static var player = AudioPlayer();
  static var d;

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
    return ChangeNotifierProvider(
      create: (context) {
        return PlayerNotif();
      },
      child: FutureBuilder(
          future: audios,
          builder: (context, snapshot) {
            if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
            var items = snapshot.data;
            return GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 4.9,
              children: [
                ...List.generate(items.length, (index) => sotkadr(index, items)),
              ],
            );
          }
      ),
    );
  }
  var indexPlaying = -1;
  Widget sotkadr(int index, List<dynamic> items) {
    bool currentPlaying = indexPlaying == index && SotPage.player.playing;
    return GestureDetector(
      onTap: () async {
        try {
          if(currentPlaying) {
            setState(() {
              SotPage.player.pause();
            });
            return;
          }

          var duration = await SotPage.player.setUrl('http://shahidchegini.ir/app_kabireh/audios/1/${items[index]}');
          SotPage.player.play();
          showBottomSheet(
              context: context,
              builder: (ctx) {
                return MusicBottomSheet();
              });
          setState(() {
            indexPlaying = index;
          });
          return;
          await SotPage.assetsAudioPlayer.open(
            Audio.liveStream(
                "http://shahidchegini.ir/app_kabireh/audios/1/out2.mp3"),
            showNotification: true,
            seek: Duration(seconds: 44),
          );
          SotPage.assetsAudioPlayer.currentPosition.listen((event) {
          });
          SotPage.assetsAudioPlayer.seekBy(Duration(seconds: 12));
        } catch (t) {
          //mp3 unreachable
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            color: indexPlaying == index && SotPage.player.playing? const Color(0xffDFFFDF): const Color(0xffffffff),
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
                    Text("1."),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    playButton(currentPlaying)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

class MusicBottomSheet extends StatefulWidget {
  @override
  _MusicBottomSheetState createState() => _MusicBottomSheetState();
}

class _MusicBottomSheetState extends State<MusicBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        color: Colors.white10,
        child: Row(
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    if(SotPage.player.playing)
                      SotPage.player.pause();
                    else {
                      SotPage.player.play();
                    }
                  });
                },
                child: playButton(SotPage.player.playing)

            ),
//        playButton(SotPage.assetsAudioPlayer.isPlaying != null?true:false)
          ],
        ));
    ;
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
  static var player = AudioPlayer();
}
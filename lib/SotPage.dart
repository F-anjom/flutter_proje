import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/MyDrawer.dart';

class SotPage extends StatelessWidget {
  final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      childAspectRatio: 3.8,
      children: [
        ...List.generate(20, (index) => sotkadr()),
      ],
    );
  }

  Widget sotkadr() {
    return GestureDetector(
      onTap: () async {

        try {
          assetsAudioPlayer.stop();
          await assetsAudioPlayer.open(
            Audio.network("http://shahidchegini.ir/app_kabireh/audios/1/out2.mp3"),
            showNotification: true,
            seek: Duration(seconds: 44),
          );
          assetsAudioPlayer.currentPosition.listen((event) {print(event);});
          assetsAudioPlayer.seekBy(Duration(seconds: 12));
        } catch (t) {
          //mp3 unreachable
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10,bottom: 18),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            color: const Color(0xffffffff),
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
          Row(
            children: [
              Text("1."),
              Column(
//              mainAxisAlignment: MainAxisAlignment.,
                children: [
                  Text(
                    'سخنرانی',
                    style: TextStyle(
                      fontFamily: 'B Baran',
                      fontSize: 12,
                      color: const Color(0xffad9f9f),
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    'عنوان',
                    style: TextStyle(
                      fontFamily: 'B Ferdosi',
                      fontSize: 35,
                      color: const Color(0xff707070),
                      height: 0.8
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
             Row(
               children: [
                 Container(
                   child: Icon(Icons.share, color: Colors.grey,),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(
                         Radius.elliptical(9999.0, 9999.0)),
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
                 Container(
                   height: 40,
                   width: 40,
                   child: Icon(Icons.play_arrow, color: Colors.white,),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(
                         Radius.elliptical(9999.0, 9999.0)),
                     color: const Color(0xff60b44b),
                     boxShadow: [
                       BoxShadow(
                         color: const Color(0x29000000),
                         offset: Offset(1, 1),
                         blurRadius: 0,
                       ),
                     ],
                   ),)
               ],
             )
            ],
          ),
        ),
      ),
    );
  }
}

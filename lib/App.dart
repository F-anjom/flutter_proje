import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_proje/FirstPage.dart';
import 'package:flutter_proje/SotPage.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
    ],
    locale: Locale("fa", "IR"),
    home: ChangeNotifierProvider(
      create: (ctx){return PlayerNotif();},
      child: FirstPage(),
    )
    );
  }
}

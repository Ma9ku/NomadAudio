import 'dart:io';
import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nomad_player/providers/albumDataProvider.dart';
import 'package:provider/provider.dart';
import 'package:nomad_player/navigation/tabbar.dart';

import 'models/tabbarModel.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TabbarModel>(
          create: (context) => TabbarModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AlbumDataProvider(),
        )
        // Add other providers if needed
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white10,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          selectedItemColor: Color(0xFf1C7A74),
          unselectedItemColor: Colors.white38

        )
      ),
      home: ChangeNotifierProvider<TabbarModel>(
        child: Tabbar(index: 0,),
        create: (BuildContext context) => TabbarModel(),
      )
    );
  }
}

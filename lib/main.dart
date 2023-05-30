import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nomad_player/providers/albumDataProvider.dart';
import 'package:provider/provider.dart';
import 'package:nomad_player/navigation/tabbar.dart';

import 'models/tabbarModel.dart';

import 'package:nomad_player/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


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
        child: WidgetTree(),
        create: (BuildContext context) => TabbarModel(),
      )
    );
  }
}

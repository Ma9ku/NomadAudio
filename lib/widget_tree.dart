import 'package:nomad_player/auth.dart';
import 'package:nomad_player/views/home.dart';
import 'package:nomad_player/views/login_register_page.dart';
import 'package:flutter/material.dart';
import 'package:nomad_player/navigation/tabbar.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Tabbar(index: 0);
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
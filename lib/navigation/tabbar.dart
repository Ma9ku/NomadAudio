import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nomad_player/views/home.dart';
import 'package:nomad_player/views/library.dart';
import 'package:nomad_player/views/profile.dart';
import 'package:nomad_player/views/search.dart';

import '../models/tabbarModel.dart';

class Tabbar extends StatefulWidget {
  final int index;

  const Tabbar({Key? key, required this.index}) : super(key: key);

  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  late TabbarModel? tabbarModel;
  late int _currIndex;

  @override
  void initState() {
    setState(() {
      _currIndex = widget.index;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currIndex,
        onTap: (index) {
          setState(() {
            _currIndex = index;
            tabbarModel = Provider.of<TabbarModel>(context, listen: false);
            tabbarModel?.setCurrentIndex(index);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Поиск'),
          BottomNavigationBarItem(icon: Icon(Icons.library_music_outlined), label: 'Мои плейлисты'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: 'Профиль'),
        ],
      ),
      body: Stack(
        children: [
          renderView(0, HomeView()),
          renderView(1, SearchView()),
          renderView(2, LibraryView()),
          renderView(3, ProfileView()),
        ],
      ),
    );
  }

  Widget renderView(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: _currIndex != tabIndex,
      child: Opacity(
        opacity: _currIndex == tabIndex ? 1 : 0,
        child: view,
      ),
    );
  }
}

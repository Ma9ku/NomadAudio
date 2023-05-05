import 'package:flutter/material.dart';
import 'package:nomad_player/views/home.dart';
import 'package:nomad_player/views/library.dart';
import 'package:nomad_player/views/profile.dart';
import 'package:nomad_player/views/search.dart';

class Tabbar extends StatefulWidget {
  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currIndex,
        onTap: (index) {
          setState(() {
            _currIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.library_music_outlined), label: 'My Library'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: 'Person'),
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
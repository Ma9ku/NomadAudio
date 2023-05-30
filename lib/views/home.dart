import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:nomad_player/auth.dart';

import '../widgets/RowSongCard.dart';
import '../widgets/albumCard.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();

}

class _HomeViewState extends State<HomeView> {
  final User? user = Auth().currentUser;
  // user?.email for email

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFf1C7A74), Colors.white.withOpacity(0)]
              )
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Недавно прослушанные", style: Theme.of(context).textTheme.headline6,),
                        Row(
                          children: const [
                            Icon(Icons.history),
                            SizedBox(width: 10,),
                            Icon(Icons.settings)
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row1(),
                  SizedBox(height: 16,),
                  Row2(),
                  SizedBox(height: 32,),
                  Row(
                    children: [
                      SizedBox(width: 16,),
                      Text("Плейлисты Pop", style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                  Row3(),
                  SizedBox(height: 32,),
                  Row(
                    children: [
                      SizedBox(width: 16,),
                      Text("Плейлисты RnB", style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                  SizedBox(width: 16,),
                  Row3(),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}

class Row1 extends StatelessWidget {
  const Row1({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      child: Row(
          children: const [
            AlbumCard(
              label: 'Illuminate',
              poster: AssetImage("assets/album7.jpeg"),
              author: 'Shawn Mendes',
            ),
            SizedBox(width: 16,),
            AlbumCard(
                label: 'In my blood',
                poster: AssetImage("assets/album6.jpeg"),
                author: 'Shawn Mendes'
            ),
            SizedBox(width: 16,),
            AlbumCard(
                label: 'Wonder',
                poster: AssetImage("assets/album5.jpeg"),
                author: 'Shawn Mendes'
            ),
            SizedBox(width: 16,),
            AlbumCard(
                label: 'Shawn Mendes',
                poster: AssetImage("assets/album4.webp"),
                author: 'Shawn Mendes'
            ),
          ]
      ),
    );
  }
}

class Row2 extends StatelessWidget {
  const Row2({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Недавно прослушанные песни", style: Theme.of(context).textTheme.headline6,),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RowSongCard(label: 'No promises', artist: 'Shawn Mendes', poster: AssetImage("assets/album7.jpeg")),
              SizedBox(width: 16,),
              RowSongCard(label: 'Die alone', artist: 'Finneas', poster: AssetImage("assets/album12.png")),
            ],
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RowSongCard(label: 'Lost in Japan', artist: 'Shawn Mendes', poster: AssetImage("assets/album4.webp")),
              SizedBox(width: 16,),
              RowSongCard(label: 'Happier than ever', artist: 'Billie Eilish', poster: AssetImage("assets/album11.jpeg")),
            ],
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RowSongCard(label: 'Hold on', artist: 'Shawn Mendes', poster: AssetImage("assets/album7.jpeg")),
              SizedBox(width: 16,),
              RowSongCard(label: 'Bad habbits', artist: 'Ed Sheeran', poster: AssetImage("assets/album13.jpeg")),
            ],
          )
        ],
      ),
    );
  }
}

class Row3 extends StatelessWidget {
  const Row3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      child: Row(
          children: [
            AlbumCard(
              label: 'No promises',
              poster: AssetImage("assets/album7.jpeg"),
              author: 'Shawn Mendes'
            ),
            SizedBox(width: 16,),
            AlbumCard(
              label: 'In my blood',
              poster: AssetImage("assets/album6.jpeg"),
              author: 'Shawn Mendes'
            ),
            SizedBox(width: 16,),
            AlbumCard(
              label: 'Wonder',
              poster: AssetImage("assets/album5.jpeg"),
              author: 'Shawn Mendes'
            ),
            SizedBox(width: 16,),
            AlbumCard(
              label: 'Lost in Japan',
              poster: AssetImage("assets/album4.webp"),
              author: 'Shawn Mendes'
            ),
          ]
      ),
    );
  }
}


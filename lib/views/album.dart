import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigation/tabbar.dart';

List<Map<String, dynamic>> playlists = [
  {
    'playlist': 'In my blood',
    'fav': false,
    'artist': 'Shawn Mendes',
    'label': 'No promises',
    'poster': AssetImage('assets/album7.jpeg'),
  },
  {
    'playlist': 'In my blood',
    'fav': false,
    'artist': 'Shawn Mendes',
    'label': 'Dream',
    'poster': AssetImage('assets/album7.jpeg'),
  },
  {
    'playlist': 'In my blood',
    'fav': false,
    'artist': 'Shawn Mendes',
    'label': 'Mercy',
    'poster': AssetImage('assets/album7.jpeg'),
  },
  {
    'playlist': 'In my blood',
    'fav': false,
    'artist': 'Shawn Mendes',
    'label': 'No promises',
    'poster': AssetImage('assets/album12.png'),
  },
  {
    'playlist': 'In my blood',
    'fav': false,
    'artist': 'Shawn Mendes',
    'label': 'No promises',
    'poster': AssetImage('assets/album11.jpeg'),
  },
  {
    'playlist': 'In my blood',
    'fav': false,
    'artist': 'Shawn Mendes',
    'label': 'No promises',
    'poster': AssetImage('assets/album10.webp'),
  },
  {
    'playlist': 'In my blood',
    'fav': false,
    'artist': 'Shawn Mendes',
    'label': 'No promises',
    'poster': AssetImage('assets/album7.jpeg'),
  },
  {
    'playlist': 'Illuminate',
    'fav': false,
    'artist': 'Shawn Mendes',
    'label': 'Bad reputation',
    'poster': AssetImage('assets/album6.jpeg'),
  },
  {
    'playlist': 'Illuminate',
    'fav': false,
    'artist': 'Shawn Mendes',
    'label': 'Hold on',
    'poster': AssetImage('assets/album6.jpeg'),
  },
  {
    'playlist': 'Wonder',
    'fav': false,
    'artist': 'Shawn Mendes',
    'label': 'Always been you',
    'poster': AssetImage('assets/album6.jpeg'),
  },
  {
    'playlist': 'Shawn Mendes',
    'fav': false,
    'artist': 'Shawn Mendes',
    'label': 'Lost in Japan',
    'poster': AssetImage('assets/album8.jpeg'),
  },
  {
    'playlist': 'Shawn Mendes',
    'fav': false,
    'artist': 'Shawn Mendes',
    'label': 'Mutual',
    'poster': AssetImage('assets/album8.jpeg'),
  },
];


class AlbumView extends StatefulWidget {
  const AlbumView({Key? key, required this.image, required this.artist, required this.playlist}) : super(key: key);
  final ImageProvider image;
  final String artist;
  final String playlist;

  @override
  AlbumViewState createState() => AlbumViewState();
}

class AlbumViewState extends State<AlbumView> {
  ScrollController? scrollController;
  double imageSize = 0;
  double initSize = 240;
  @override
  void initState() {
    imageSize = initSize;
    scrollController = ScrollController();
    scrollController?.addListener(() {
      imageSize = initSize - scrollController!.offset;

      if (imageSize > 0 && initSize > imageSize) {
        setState(() {
          imageSize = initSize;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _currIndex = 0;

    List<Map<String, dynamic>> filteredPlaylists = [];

    filteredPlaylists.addAll(playlists);
    filteredPlaylists.retainWhere((playlist) {
      return playlist['playlist'] == widget.playlist && playlist['artist'] == widget.artist;
    });

// Use the filtered list of playlists however you need, for example:
    filteredPlaylists.forEach((playlist) {
      print('${playlist['label']} by ${playlist['artist']}');
    });

    setState(() {
      imageSize = initSize;
    });
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currIndex,
        onTap: (index) {
          setState(() {
            _currIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.home_outlined),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tabbar(index: 0))
                );
              },
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tabbar(index: 1))
                );
              },
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.library_music_outlined),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tabbar(index: 2))
                );
              },
            ),
            label: 'My Library'
          ),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.person_2_outlined),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tabbar(index: 3))
                  );
                },
              ),
              label: 'Person'
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xFf1C7A74),
          ),
          SafeArea(
            child: SingleChildScrollView(
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment. topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                        ]
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 60, 0, 40),
                      child: Column(
                        children: [
                          Image(
                            image: widget.image,
                            width: imageSize,
                            height: imageSize,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              widget.playlist,
                                              style: TextStyle(fontSize: 24, color: Colors.white),

                                            ),
                                            Text(
                                              widget.artist,
                                              style: TextStyle(fontSize: 16, color: Colors.white54)
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        AddButton(),
                                        // SizedBox(width: 16,),
                                        ShuffleButton(),
                                        // SizedBox(width: 16,),
                                        PlayButton(),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all (16),
                      color: Colors.black,
                      height: 600,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: filteredPlaylists.map((e) {
                          return Column(
                            children: [
                              AlbumSongCard(fav: e['fav'], artist: e['artist'], label: e['label'], poster: e['poster']),
                              SizedBox(height: 8),
                            ],
                          );
                        }).toList(),
                      )
                  )
                ],
              ),
            ),
          ),
          Positioned(
              child: Container(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: SafeArea(
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.arrow_back_ios,), onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Tabbar(index: 0,))
                            );
                          },
                        ),
                        Text(widget.playlist, style: Theme.of(context).textTheme.headlineSmall,)
                      ],
                    ),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}

class AlbumSongCard extends StatefulWidget {
  final ImageProvider poster;
  final String label;
  final String artist;
  final bool fav;

  const AlbumSongCard({
    Key? key, required this.poster, required this.label, required this.artist, required this.fav
  }) : super(key: key);

  @override
  _AlbumSongCardState createState() => _AlbumSongCardState();
}

class _AlbumSongCardState extends State<AlbumSongCard> {
  bool _isFav = false;

  @override
  void initState() {
    super.initState();
    _isFav = widget.fav;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Image(
            image: widget.poster,
            height: 64,
            width: 64,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.label, style: TextStyle(fontSize: 18)),
                    SizedBox(height: 4),
                    Text(
                      widget.artist,
                      style: TextStyle(fontSize: 14, color: Colors.white54),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _isFav = !_isFav;
                          });
                        },
                        icon: Icon(
                          Icons.favorite_rounded,
                          color: _isFav ? Color(0xff21a89e) : Colors.white54,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddButton extends StatefulWidget {
  @override
  _AddButtonState createState() => _AddButtonState();
}
class _AddButtonState extends State<AddButton> {
  bool added = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: IconButton(
        icon: Icon(!added ? Icons.add_rounded : Icons.check_rounded,
            color: !added ? Colors.white : Color(0xff21a89e),
            size: 36),
        onPressed: () {
          setState(() {
            added = !added;
          });
        },
      ),
    );
  }
}

class ShuffleButton extends StatefulWidget {
  @override
  _ShuffleButtonState createState() => _ShuffleButtonState();
}
class _ShuffleButtonState extends State<ShuffleButton> {
  bool shuffled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: IconButton(
        icon: Icon(Icons.shuffle_rounded,
            color: !shuffled ? Colors.white : Color(0xff21a89e),
            size: 36),
        onPressed: () {
          setState(() {
            shuffled = !shuffled;
          });
        },
      ),
    );
  }
}

class PlayButton extends StatefulWidget {
  @override
  _PlayButtonState createState() => _PlayButtonState();
}
class _PlayButtonState extends State<PlayButton> {
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: IconButton(
        icon: Icon(Icons.play_arrow_rounded,
            color: !playing ? Colors.white : Color(0xff21a89e),
            size: 36),
        onPressed: () {
          setState(() {
            playing = !playing;
          });
        },
      ),
    );
  }
}
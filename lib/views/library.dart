import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/albumCard.dart';
import 'album.dart';

class LibraryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          SafeArea(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Text(
                  'Мои плейлисты',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row0(),

                SizedBox(height: 16,),

                Text(
                  'Любимые',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row1(),

                SizedBox(height: 16,),

                Text(
                  'Чужие плейлисты',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row1(),

                SizedBox(height: 16,),

                Text(
                  'Recommended for You',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                _buildPlaylistCard(
                  context: context,
                  title: 'Discover Weekly',
                  subtitle: 'Playlist • Updated every Monday',
                  image: AssetImage('assets/album2.jpeg'),
                ),
                SizedBox(height: 16.0),
                _buildPlaylistCard(
                  context: context,
                  title: 'Release Radar',
                  subtitle: 'Playlist • Updated every Friday',
                  image: AssetImage('assets/album2.jpeg'),
                ),
                SizedBox(height: 16.0),
                _buildPlaylistCard(
                  context: context,
                  title: 'Top Recommendations',
                  subtitle: 'Playlist • Updated daily',
                  image: AssetImage('assets/album1.jpeg'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPlaylistCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required ImageProvider<Object> image,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AlbumView(image: image, playlist: title, artist: subtitle)),
        );
      },
      child: Card(
        elevation: 2.0,
        color: Colors.black54, // Change the background color to navy green
        child: ListTile(
          leading: Container(
            width: 56.0,
            height: 56.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle),
        ),
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
      padding: EdgeInsets.symmetric(vertical: 16),
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

class Row0 extends StatelessWidget {
  const Row0({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
          children: const [
            AlbumCard(
              label: 'Добавить',
              poster: AssetImage("assets/AddPlay.png"),
              author: '',
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
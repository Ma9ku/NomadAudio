import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomad_player/views/album.dart';
import 'package:provider/provider.dart';

class AlbumCard extends StatelessWidget {
  final ImageProvider poster;
  final String label;
  final String author;

  const AlbumCard({Key? key, required this.poster, required this.label, required this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AlbumView(image: poster, playlist: label, artist: author))
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: poster,
            width: 140,
            height: 140,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10,),
          Text(label)
        ],
      ),
    );
  }
}
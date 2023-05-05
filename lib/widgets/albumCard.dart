import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomad_player/views/album.dart';

class AlbumCard extends StatelessWidget {
  final ImageProvider poster;
  final String label;

  const AlbumCard({Key? key, required this.poster, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AlbumView())
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowSongCard extends StatelessWidget {
  final ImageProvider poster;
  final String label;
  final String artist;

  const RowSongCard({
    Key? key, required this.poster, required this.label, required this.artist
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(4)
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Image(image: poster, height: 48, width: 48, fit: BoxFit.cover,),
            SizedBox(width: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(fontSize: 14)),
                Text(artist, style: TextStyle(fontSize: 12, color: Colors.white54)),
              ],
            )
          ],
        ),
      ),
    );
  }
}